import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';

var audio = AudioPlayer();
var audioStat = {};
var dummyData =
    '''[{"type":"shortVideo","title":"I Almost Fought in This","videoId":"v0d2Ns_WRl4","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/v0d2Ns_WRl4/3.jpg","width":120,"height":90}],"lengthSeconds":634,"author":"penguinz0","authorId":"UCq6VFHwMzcMXbuKyG7SQYIg","authorUrl":"/channel/UCq6VFHwMzcMXbuKyG7SQYIg","published":1670897701,"publishedText":"9 hours ago","viewCount":720980},{"type":"shortVideo","title":"A Man Drank Suspicious Coconut Water For Lunch. This Is What Happened To His Brain.","videoId":"VZut_SZYybA","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/VZut_SZYybA/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/VZut_SZYybA/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/VZut_SZYybA/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/VZut_SZYybA/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/VZut_SZYybA/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/VZut_SZYybA/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/VZut_SZYybA/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/VZut_SZYybA/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/VZut_SZYybA/3.jpg","width":120,"height":90}],"lengthSeconds":692,"author":"Chubbyemu","authorId":"UCKOvOaJv4GK-oDqx-sj7VVg","authorUrl":"/channel/UCKOvOaJv4GK-oDqx-sj7VVg","published":1670891408,"publishedText":"10 hours ago","viewCount":219114},{"type":"shortVideo","title":"This Happens Every Time You Flush","videoId":"oYu-KepNLPk","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/oYu-KepNLPk/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/oYu-KepNLPk/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/oYu-KepNLPk/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/oYu-KepNLPk/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/oYu-KepNLPk/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/oYu-KepNLPk/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/oYu-KepNLPk/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/oYu-KepNLPk/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/oYu-KepNLPk/3.jpg","width":120,"height":90}],"lengthSeconds":152,"author":"Daily Dose Of Internet","authorId":"UCdC0An4ZPNr_YiFiYoVbwaw","authorUrl":"/channel/UCdC0An4ZPNr_YiFiYoVbwaw","published":1670878809,"publishedText":"14 hours ago","viewCount":2254099},{"type":"shortVideo","title":"Apple Replay got a glow up this year. #shorts","videoId":"PUb3OPYWQPo","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/PUb3OPYWQPo/3.jpg","width":120,"height":90}],"lengthSeconds":0,"author":"The Verge","authorId":"UCddiUEpeqJcYeBxX1IVBKvQ","authorUrl":"/channel/UCddiUEpeqJcYeBxX1IVBKvQ","published":1670877523,"publishedText":"14 hours ago","viewCount":9368},{"type":"shortVideo","title":"Help me step bro I'm stuck in elo hell","videoId":"t31FYhiW2ss","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/t31FYhiW2ss/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/t31FYhiW2ss/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/t31FYhiW2ss/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/t31FYhiW2ss/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/t31FYhiW2ss/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/t31FYhiW2ss/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/t31FYhiW2ss/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/t31FYhiW2ss/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/t31FYhiW2ss/3.jpg","width":120,"height":90}],"lengthSeconds":707,"author":"Teo","authorId":"UCDa8HbNrmkFhKKOeiB7JaRw","authorUrl":"/channel/UCDa8HbNrmkFhKKOeiB7JaRw","published":1670871240,"publishedText":"16 hours ago","viewCount":104765},{"type":"shortVideo","title":"How To Measure The Tiniest Forces In The Universe","videoId":"pXoZQsZP2PY","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/pXoZQsZP2PY/3.jpg","width":120,"height":90}],"lengthSeconds":934,"author":"Veritasium","authorId":"UCHnyfMqiRRG1u-2MsSQLbXA","authorUrl":"/channel/UCHnyfMqiRRG1u-2MsSQLbXA","published":1670860437,"publishedText":"19 hours ago","viewCount":1274791},{"type":"shortVideo","title":"The 7 Best Handheld Emulators Of 2022! Arm Powered Devices","videoId":"zqpKcA68y8c","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/zqpKcA68y8c/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/zqpKcA68y8c/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/zqpKcA68y8c/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/zqpKcA68y8c/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/zqpKcA68y8c/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/zqpKcA68y8c/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/zqpKcA68y8c/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/zqpKcA68y8c/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/zqpKcA68y8c/3.jpg","width":120,"height":90}],"lengthSeconds":616,"author":"ETA PRIME","authorId":"UC_0CVCfC_3iuHqmyClu59Uw","authorUrl":"/channel/UC_0CVCfC_3iuHqmyClu59Uw","published":1670857800,"publishedText":"20 hours ago","viewCount":28910},{"type":"shortVideo","title":"Installation And First Look Of Deepin 20.8 (And It's Gorgeous!)","videoId":"xNHe_4VOXfc","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/xNHe_4VOXfc/3.jpg","width":120,"height":90}],"lengthSeconds":1559,"author":"DistroTube","authorId":"UCVls1GmFKf6WlTraIb_IaJg","authorUrl":"/channel/UCVls1GmFKf6WlTraIb_IaJg","published":1670853635,"publishedText":"21 hours ago","viewCount":13328},{"type":"shortVideo","title":"What came before Street Fighter ? | MVG","videoId":"h3xv1juAuDg","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/h3xv1juAuDg/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/h3xv1juAuDg/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/h3xv1juAuDg/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/h3xv1juAuDg/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/h3xv1juAuDg/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/h3xv1juAuDg/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/h3xv1juAuDg/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/h3xv1juAuDg/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/h3xv1juAuDg/3.jpg","width":120,"height":90}],"lengthSeconds":886,"author":"Modern Vintage Gamer","authorId":"UCjFaPUcJU1vwk193mnW_w1w","authorUrl":"/channel/UCjFaPUcJU1vwk193mnW_w1w","published":1670849103,"publishedText":"22 hours ago","viewCount":45138},{"type":"shortVideo","title":"How To Terraform Mars - WITH LASERS","videoId":"HpcTJW4ur54","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/HpcTJW4ur54/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/HpcTJW4ur54/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/HpcTJW4ur54/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/HpcTJW4ur54/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/HpcTJW4ur54/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/HpcTJW4ur54/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/HpcTJW4ur54/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/HpcTJW4ur54/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/HpcTJW4ur54/3.jpg","width":120,"height":90}],"lengthSeconds":688,"author":"Kurzgesagt â In a Nutshell","authorId":"UCsXVk37bltHxD1rDPwtNM8Q","authorUrl":"/channel/UCsXVk37bltHxD1rDPwtNM8Q","published":1670770809,"publishedText":"1 day ago","viewCount":2836982},{"type":"shortVideo","title":"Mario Party, but with too many people","videoId":"d2X9kWhC5i4","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/d2X9kWhC5i4/3.jpg","width":120,"height":90}],"lengthSeconds":1156,"author":"Alpharad","authorId":"UCBODyKF0JMbUd6D9Bklyzbw","authorUrl":"/channel/UCBODyKF0JMbUd6D9Bklyzbw","published":1670713214,"publishedText":"2 days ago","viewCount":521779},{"type":"shortVideo","title":"EU destroys Meta, Huge Mint 21.1 Beta, Mac GPU support: Linux & Open Source News","videoId":"hRfxJHW2EqA","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/hRfxJHW2EqA/3.jpg","width":120,"height":90}],"lengthSeconds":994,"author":"The Linux Experiment","authorId":"UC5UAwBUum7CPN5buc-_N1Fw","authorUrl":"/channel/UC5UAwBUum7CPN5buc-_N1Fw","published":1670691627,"publishedText":"2 days ago","viewCount":52724},{"type":"shortVideo","title":"We dropped an UNRELEASED album on discord","videoId":"ijxjIen_rtA","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/ijxjIen_rtA/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/ijxjIen_rtA/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/ijxjIen_rtA/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/ijxjIen_rtA/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/ijxjIen_rtA/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/ijxjIen_rtA/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/ijxjIen_rtA/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/ijxjIen_rtA/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/ijxjIen_rtA/3.jpg","width":120,"height":90}],"lengthSeconds":1118,"author":"Softwilly","authorId":"UCA88kGBpPHRCxAcskmUh23w","authorUrl":"/channel/UCA88kGBpPHRCxAcskmUh23w","published":1670684426,"publishedText":"2 days ago","viewCount":349456},{"type":"shortVideo","title":"Far Cry 6 - How Many Glitches Can We Find [PART 1]","videoId":"L2EdfJ-Zkbo","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/L2EdfJ-Zkbo/3.jpg","width":120,"height":90}],"lengthSeconds":482,"author":"DeSinc","authorId":"UC4nJnJ-HO5vVbGlJ14rf5yg","authorUrl":"/channel/UC4nJnJ-HO5vVbGlJ14rf5yg","published":1670673605,"publishedText":"2 days ago","viewCount":135521},{"type":"shortVideo","title":"Luke Smith: The Return to Normalcy - (Live interview by Justin Murphy)","videoId":"VcHW0mpi9y8","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/VcHW0mpi9y8/3.jpg","width":120,"height":90}],"lengthSeconds":5032,"author":"Luke Smith","authorId":"UC2eYFnH61tmytImy1mTYvhA","authorUrl":"/channel/UC2eYFnH61tmytImy1mTYvhA","published":1670616022,"publishedText":"3 days ago","viewCount":28481},{"type":"shortVideo","title":"Why Visiting This Lost Island Will Kill You","videoId":"oWarOTnOIeI","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/oWarOTnOIeI/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/oWarOTnOIeI/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/oWarOTnOIeI/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/oWarOTnOIeI/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/oWarOTnOIeI/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/oWarOTnOIeI/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/oWarOTnOIeI/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/oWarOTnOIeI/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/oWarOTnOIeI/3.jpg","width":120,"height":90}],"lengthSeconds":1287,"author":"RealLifeLore","authorId":"UCP5tjEmvPItGyLhmjdwP7Ww","authorUrl":"/channel/UCP5tjEmvPItGyLhmjdwP7Ww","published":1670608683,"publishedText":"3 days ago","viewCount":579581},{"type":"shortVideo","title":"Choo-Choo Charles.. WHY DID I DOWNLOAD THIS GAME - Part 1","videoId":"oxDhb6q9qmM","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/oxDhb6q9qmM/3.jpg","width":120,"height":90}],"lengthSeconds":2517,"author":"CoryxKenshin","authorId":"UCiYcA0gJzg855iSKMrX3oHg","authorUrl":"/channel/UCiYcA0gJzg855iSKMrX3oHg","published":1670599862,"publishedText":"3 days ago","viewCount":4674459},{"type":"shortVideo","title":"Choo Choo Charles Is Terrifying","videoId":"eDDFhGKBMCQ","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/eDDFhGKBMCQ/3.jpg","width":120,"height":90}],"lengthSeconds":985,"author":"GmanLives","authorId":"UCKlUrYO3i9MDlL45Ia6j5EA","authorUrl":"/channel/UCKlUrYO3i9MDlL45Ia6j5EA","published":1670598023,"publishedText":"3 days ago","viewCount":277257},{"type":"shortVideo","title":"The science of falling in love - Shannon Odell","videoId":"f_OPjYQovAE","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/f_OPjYQovAE/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/f_OPjYQovAE/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/f_OPjYQovAE/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/f_OPjYQovAE/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/f_OPjYQovAE/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/f_OPjYQovAE/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/f_OPjYQovAE/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/f_OPjYQovAE/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/f_OPjYQovAE/3.jpg","width":120,"height":90}],"lengthSeconds":401,"author":"TED-Ed","authorId":"UCsooa4yRKGN_zEE8iknghZA","authorUrl":"/channel/UCsooa4yRKGN_zEE8iknghZA","published":1670515311,"publishedText":"4 days ago","viewCount":254556},{"type":"shortVideo","title":"Quake 4 - Stroggjammin'","videoId":"MTGXcrRdO_k","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/MTGXcrRdO_k/3.jpg","width":120,"height":90}],"lengthSeconds":2709,"author":"Civvie 11","authorId":"UC21uZkfXpT8rPY-gPgMiCwA","authorUrl":"/channel/UC21uZkfXpT8rPY-gPgMiCwA","published":1670428017,"publishedText":"5 days ago","viewCount":334168},{"type":"shortVideo","title":"Ranking Your VILE Tiktoks","videoId":"qtWvnmAfz5E","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/qtWvnmAfz5E/3.jpg","width":120,"height":90}],"lengthSeconds":1840,"author":"jschlattLIVE","authorId":"UC2mP7il3YV7TxM_3m6U0bwA","authorUrl":"/channel/UC2mP7il3YV7TxM_3m6U0bwA","published":1670361301,"publishedText":"6 days ago","viewCount":2564694},{"type":"shortVideo","title":"Let's Cook - Creamy Jiggly LIBRE Flan","videoId":"WNlVCe5nmTU","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/WNlVCe5nmTU/3.jpg","width":120,"height":90}],"lengthSeconds":1906,"author":"Mental Outlaw","authorId":"UC7YOGHUfC1Tb6E4pudI9STA","authorUrl":"/channel/UC7YOGHUfC1Tb6E4pudI9STA","published":1670202011,"publishedText":"1 week ago","viewCount":26999},{"type":"shortVideo","title":"Beating Minecraft's Easter Egg Update","videoId":"LU9JtSwxBqI","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/LU9JtSwxBqI/3.jpg","width":120,"height":90}],"lengthSeconds":1100,"author":"rekrap2","authorId":"UCvt0HYxX34vUvqu66HLXeUw","authorUrl":"/channel/UCvt0HYxX34vUvqu66HLXeUw","published":1670077809,"publishedText":"1 week ago","viewCount":1415642},{"type":"shortVideo","title":"Scanning Retro Magazines with a CZUR ET18 Pro | Official Cave Dwellers Edition","videoId":"oNS4TJDjDiM","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/oNS4TJDjDiM/3.jpg","width":120,"height":90}],"lengthSeconds":1228,"author":"RMC - The Cave","authorId":"UCLEoyoOKZK0idGqSc6Pi23w","authorUrl":"/channel/UCLEoyoOKZK0idGqSc6Pi23w","published":1669906832,"publishedText":"1 week ago","viewCount":26844},{"type":"shortVideo","title":"How Florida Got So Weird","videoId":"AIqxfBhlwx0","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/AIqxfBhlwx0/3.jpg","width":120,"height":90}],"lengthSeconds":1259,"author":"Wendover Productions","authorId":"UC9RM-iSvTu1uPJb8X5yp3EQ","authorUrl":"/channel/UC9RM-iSvTu1uPJb8X5yp3EQ","published":1669829878,"publishedText":"1 week ago","viewCount":1723741},{"type":"shortVideo","title":"Why It's Rude to Suck at Warcraft","videoId":"BKP1I7IocYU","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/BKP1I7IocYU/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/BKP1I7IocYU/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/BKP1I7IocYU/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/BKP1I7IocYU/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/BKP1I7IocYU/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/BKP1I7IocYU/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/BKP1I7IocYU/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/BKP1I7IocYU/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/BKP1I7IocYU/3.jpg","width":120,"height":90}],"lengthSeconds":5055,"author":"Folding Ideas","authorId":"UCyNtlmLB73-7gtlBz00XOQQ","authorUrl":"/channel/UCyNtlmLB73-7gtlBz00XOQQ","published":1669420263,"publishedText":"2 weeks ago","viewCount":1011482},{"type":"shortVideo","title":"Alien: Isolation Review","videoId":"NyIA-SRJGco","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/NyIA-SRJGco/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/NyIA-SRJGco/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/NyIA-SRJGco/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/NyIA-SRJGco/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/NyIA-SRJGco/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/NyIA-SRJGco/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/NyIA-SRJGco/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/NyIA-SRJGco/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/NyIA-SRJGco/3.jpg","width":120,"height":90}],"lengthSeconds":2212,"author":"MandaloreGaming","authorId":"UClOGLGPOqlAiLmOvXW5lKbw","authorUrl":"/channel/UClOGLGPOqlAiLmOvXW5lKbw","published":1669384814,"publishedText":"2 weeks ago","viewCount":848809},{"type":"shortVideo","title":"Age of Wonders 1 Review | 800x600Â® Editionâ¢","videoId":"1UiJQ3PNEaM","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/1UiJQ3PNEaM/3.jpg","width":120,"height":90}],"lengthSeconds":1275,"author":"SsethTzeentach","authorId":"UCD6VugMZKRhSyzWEWA9W2fg","authorUrl":"/channel/UCD6VugMZKRhSyzWEWA9W2fg","published":1669335908,"publishedText":"2 weeks ago","viewCount":1671105},{"type":"shortVideo","title":"We became Discord Chefs","videoId":"tZ1upwtuhaA","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/tZ1upwtuhaA/3.jpg","width":120,"height":90}],"lengthSeconds":1627,"author":"isaacwhy","authorId":"UC-yfMLscSY3vP_PKC1Z5B0w","authorUrl":"/channel/UC-yfMLscSY3vP_PKC1Z5B0w","published":1669233618,"publishedText":"2 weeks ago","viewCount":905137},{"type":"shortVideo","title":"Using power tools the wrong way","videoId":"TT7O4Jkftc4","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/TT7O4Jkftc4/3.jpg","width":120,"height":90}],"lengthSeconds":1029,"author":"William Osman","authorId":"UCfMJ2MchTSW2kWaT0kK94Yw","authorUrl":"/channel/UCfMJ2MchTSW2kWaT0kK94Yw","published":1669060710,"publishedText":"3 weeks ago","viewCount":2357801},{"type":"shortVideo","title":"Top 5 Reasons Why Sonic Frontiers Is The BEST SONIC GAME EVER","videoId":"_LNkxn4qkhY","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/_LNkxn4qkhY/3.jpg","width":120,"height":90}],"lengthSeconds":2680,"author":"ThorHighHeels","authorId":"UCilouT5irlCNn2imcCDhhJQ","authorUrl":"/channel/UCilouT5irlCNn2imcCDhhJQ","published":1669058720,"publishedText":"3 weeks ago","viewCount":61924},{"type":"shortVideo","title":"Videochat November 2022","videoId":"5p0M3NDSm58","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/5p0M3NDSm58/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/5p0M3NDSm58/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/5p0M3NDSm58/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/5p0M3NDSm58/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/5p0M3NDSm58/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/5p0M3NDSm58/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/5p0M3NDSm58/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/5p0M3NDSm58/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/5p0M3NDSm58/3.jpg","width":120,"height":90}],"lengthSeconds":13870,"author":"Accursed Farms","authorId":"UCJ6KZTTnkE-s2XFJJmoTAkw","authorUrl":"/channel/UCJ6KZTTnkE-s2XFJJmoTAkw","published":1669053798,"publishedText":"3 weeks ago","viewCount":23101},{"type":"shortVideo","title":"Parents or Police?","videoId":"yoa3YlMeWL8","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/yoa3YlMeWL8/3.jpg","width":120,"height":90}],"lengthSeconds":927,"author":"Jim Browning","authorId":"UCBNG0osIBAprVcZZ3ic84vw","authorUrl":"/channel/UCBNG0osIBAprVcZZ3ic84vw","published":1668965407,"publishedText":"3 weeks ago","viewCount":539903},{"type":"shortVideo","title":"I Used Trains to Create Absolute Mayhem in Satisfactory","videoId":"wV6kWL5WU78","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/wV6kWL5WU78/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/wV6kWL5WU78/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/wV6kWL5WU78/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/wV6kWL5WU78/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/wV6kWL5WU78/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/wV6kWL5WU78/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/wV6kWL5WU78/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/wV6kWL5WU78/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/wV6kWL5WU78/3.jpg","width":120,"height":90}],"lengthSeconds":1191,"author":"Let's Game It Out","authorId":"UCto7D1L-MiRoOziCXK9uT5Q","authorUrl":"/channel/UCto7D1L-MiRoOziCXK9uT5Q","published":1668103233,"publishedText":"1 month ago","viewCount":4265769},{"type":"shortVideo","title":"RIP Slingbox! Testing the Original 2005 Slingbox in 2022","videoId":"0XDlvegECG8","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/0XDlvegECG8/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/0XDlvegECG8/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/0XDlvegECG8/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/0XDlvegECG8/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/0XDlvegECG8/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/0XDlvegECG8/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/0XDlvegECG8/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/0XDlvegECG8/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/0XDlvegECG8/3.jpg","width":120,"height":90}],"lengthSeconds":1080,"author":"LGR Blerbs","authorId":"UCw_Sxdt27ASqErScT4Rlj8A","authorUrl":"/channel/UCw_Sxdt27ASqErScT4Rlj8A","published":1667829600,"publishedText":"1 month ago","viewCount":359825},{"type":"shortVideo","title":"Horror in Impossible Places: Liminal Spaces and The Backrooms","videoId":"gp-2M_3HwFU","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/gp-2M_3HwFU/3.jpg","width":120,"height":90}],"lengthSeconds":2983,"author":"Super Eyepatch Wolf","authorId":"UCtGoikgbxP4F3rgI9PldI9g","authorUrl":"/channel/UCtGoikgbxP4F3rgI9PldI9g","published":1667336922,"publishedText":"1 month ago","viewCount":778551},{"type":"shortVideo","title":"RetroAhoy: X-COM","videoId":"gBu77h2FSCM","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/gBu77h2FSCM/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/gBu77h2FSCM/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/gBu77h2FSCM/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/gBu77h2FSCM/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/gBu77h2FSCM/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/gBu77h2FSCM/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/gBu77h2FSCM/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/gBu77h2FSCM/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/gBu77h2FSCM/3.jpg","width":120,"height":90}],"lengthSeconds":6052,"author":"Ahoy","authorId":"UCE1jXbVAGJQEORz9nZqb5bQ","authorUrl":"/channel/UCE1jXbVAGJQEORz9nZqb5bQ","published":1665759565,"publishedText":"1 month ago","viewCount":1030445},{"type":"shortVideo","title":"Context Sensitivity","videoId":"pl9G4voWfDQ","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/pl9G4voWfDQ/3.jpg","width":120,"height":90}],"lengthSeconds":2144,"author":"Matthewmatosis","authorId":"UCb_sF2m3-2azOqeNEdMwQPw","authorUrl":"/channel/UCb_sF2m3-2azOqeNEdMwQPw","published":1662640505,"publishedText":"3 months ago","viewCount":177181},{"type":"shortVideo","title":"I Trapped Every Boss in Minecraft Hardcore","videoId":"klcxgrQU5sw","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/klcxgrQU5sw/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/klcxgrQU5sw/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/klcxgrQU5sw/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/klcxgrQU5sw/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/klcxgrQU5sw/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/klcxgrQU5sw/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/klcxgrQU5sw/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/klcxgrQU5sw/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/klcxgrQU5sw/3.jpg","width":120,"height":90}],"lengthSeconds":1506,"author":"sandiction","authorId":"UCcXUhZB4t3g8EGdYiqwS4Aw","authorUrl":"/channel/UCcXUhZB4t3g8EGdYiqwS4Aw","published":1660170720,"publishedText":"4 months ago","viewCount":9507470},{"type":"shortVideo","title":"Genuinely Underrated: The Heilwald Loophole","videoId":"UDJGE2F8ZHU","videoThumbnails":[{"quality":"maxres","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/maxres.jpg","width":1280,"height":720},{"quality":"maxresdefault","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/maxresdefault.jpg","width":1280,"height":720},{"quality":"sddefault","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/sddefault.jpg","width":640,"height":480},{"quality":"high","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/hqdefault.jpg","width":480,"height":360},{"quality":"medium","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/mqdefault.jpg","width":320,"height":180},{"quality":"default","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/default.jpg","width":120,"height":90},{"quality":"start","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/1.jpg","width":120,"height":90},{"quality":"middle","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/2.jpg","width":120,"height":90},{"quality":"end","url":"https://yt.funami.tech/vi/UDJGE2F8ZHU/3.jpg","width":120,"height":90}],"lengthSeconds":1167,"author":"Jolly's Big Ol' Video Hole","authorId":"UCGfWSU7Pqu4-WMqJorOSrsQ","authorUrl":"/channel/UCGfWSU7Pqu4-WMqJorOSrsQ","published":1658770204,"publishedText":"4 months ago","viewCount":72825}]''';
var instanceUrl = 'https://yt.funami.tech/api/v1';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odi',
      theme: FlexThemeData.light(
        scheme: FlexScheme.flutterDash,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.flutterDash,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the Playground font, add GoogleFonts package and uncomment
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List videoResults = jsonDecode(dummyData);
  Future<void> getTrending() async {
    http.get(Uri.parse('$instanceUrl/popular?type=music')).then(((value) {
      setState(() {
        print(value.body);
        videoResults = jsonDecode(value.body);
      });
    }));
  }

  @override
  void initState() {
    super.initState();
// TODO: Get this working fr
    // getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Odi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (Map videoData in videoResults)
              VideoPreview(
                video: videoData,
                onCLick: (v) {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return VideoScreen(
                          v: v,
                        );
                      }));
                },
              )
          ],
        ),
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.v});

  final Map v;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    // https://invidious.tiekoetter.com/api/v1/videos/aqz-KE-bpKQ?fields=videoId,title,description,adaptiveFormats&pretty=1
    getAudio();
  }

  void getAudio() {
    http
        .get(Uri.parse(
            '$instanceUrl/videos/${widget.v['videoId']}?fields=videoId,title,description,adaptiveFormats'))
        .then((res) async {
      var data = jsonDecode(res.body);
      audio.play(UrlSource(data['adaptiveFormats'][0]['url']));
      Timer.periodic(const Duration(seconds: 1), (e) {
        if (!mounted) {
          e.cancel();

          return;
        }
        audio.getCurrentPosition().then((value) {
          audioStat['currentDuration'] = value?.inSeconds;
          setState(() {});
        });
      });
      audio.onDurationChanged.listen((event) {
        if (event.inMicroseconds < 1) {
          return;
        }
        audio.getDuration().then((value) {
          audioStat['duration'] = value?.inSeconds;
          setState(() {});
        });
      });
      audio.onPlayerStateChanged.listen((event) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    audio.dispose();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close_rounded)),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_down_rounded))
            ],
          ),
          const Spacer(),
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: AspectRatio(
                aspectRatio: 1.8,
                child: Image.network(
                  widget.v['videoThumbnails'][0]['url'],
                  scale: .75,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              widget.v['title'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  if (audio.state == PlayerState.playing) {
                    audio.pause();
                  } else {
                    audio.resume();
                  }
                },
                child: audio.state == PlayerMode.lowLatency
                    ? const CircularProgressIndicator.adaptive()
                    : Icon(audio.state == PlayerState.playing
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(intToTimeLeft(
                  Duration(seconds: audioStat['currentDuration'] ?? 0)
                      .inSeconds)),
              Slider(
                value: audioStat['currentDuration'] ?? 0,
                onChanged: (value) {
                  audio.seek(Duration(seconds: value.toInt()));
                  // audioStat['currentDuration'] = value;
                  setState(() {});
                },
                min: 0,
                max: audioStat['duration'] ?? 100,
              ),
              Text(intToTimeLeft(
                  Duration(seconds: audioStat['duration'] ?? 0).inSeconds)),
            ],
          )
        ],
      ),
    ));
  }
}

class VideoPreview extends StatelessWidget {
  const VideoPreview({
    Key? key,
    required this.video,
    required this.onCLick,
  }) : super(key: key);

  final Map video;
  final Function(Map) onCLick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        child: InkWell(
          onTap: (() {
            http
                .get(Uri.parse('$instanceUrl/channels/${video['authorId']}'))
                .then((data) {
              video['authorData'] = jsonDecode(data.body);
              onCLick(video);
            });
          }),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: [
                  AspectRatio(
                      aspectRatio: 1.8,
                      child: Image.network(
                        video['videoThumbnails'][0]['url'] ?? '',
                        fit: BoxFit.cover,
                        // fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Opacity(
                      opacity: 0.75,
                      child: Text(video['lengthSeconds'].toString()),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Tooltip(
                    message: video['title'],
                    child: Text(
                      video['title'],
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        FutureBuilder(
                            future: http.get(Uri.parse(
                                '$instanceUrl/channels/${video['authorId']}')),
                            builder: ((context, snapshot) {
                              if (snapshot.hasData) {
                                var data =
                                    jsonDecode(snapshot.data?.body ?? '{}');
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                      radius: 15,
                                      child: ClipOval(
                                        child: Image.network(
                                          data['authorThumbnails'][0]['url'],
                                        ),
                                      )),
                                );
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2.5),
                                  ),
                                );
                              }
                            })),
                        Expanded(
                            child: Text(
                          video['author'],
                          overflow: TextOverflow.ellipsis,
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String intToTimeLeft(int value) {
  int h, m, s;

  h = value ~/ 3600;

  m = ((value - h * 3600)) ~/ 60;

  s = value - (h * 3600) - (m * 60);

  String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();

  String minuteLeft =
      m.toString().length < 2 ? "0" + m.toString() : m.toString();

  String secondsLeft =
      s.toString().length < 2 ? "0" + s.toString() : s.toString();

  String result = "$hourLeft:$minuteLeft:$secondsLeft";

  return result;
}
