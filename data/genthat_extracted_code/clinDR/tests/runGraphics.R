### execute graphics test

RNGkind("default")
rm(list=objects())
if(file.exists("./clinDR/inst/tests/extraGraphics")){
	pvarA<-"./clinDR/inst/tests/extraGraphics"
} else pvarA<-NULL
source(file.path(pvarA,'test.densityplots.R'),echo=TRUE)

RNGkind("default")
rm(list=objects())
if(file.exists("./clinDR/inst/tests/extraGraphics")){
	pvarA<-"./clinDR/inst/tests/extraGraphics"
} else pvarA<-NULL
source(file.path(pvarA,'test.plot.emaxsimBobj.R'),echo=TRUE)

RNGkind("default")
rm(list=objects())
if(file.exists("./clinDR/inst/tests/extraGraphics")){
	pvarA<-"./clinDR/inst/tests/extraGraphics"
} else pvarA<-NULL
source(file.path(pvarA,'test.plot.emaxsimobj.R'),echo=TRUE)

RNGkind("default")
rm(list=objects())
if(file.exists("./clinDR/inst/tests/extraGraphics")){
	pvarA<-"./clinDR/inst/tests/extraGraphics"
} else pvarA<-NULL
source(file.path(pvarA,'test.plot.fitEmax.R'),echo=TRUE)

RNGkind("default")
rm(list=objects())
if(file.exists("./clinDR/inst/tests/extraGraphics")){
	pvarA<-"./clinDR/inst/tests/extraGraphics"
} else pvarA<-NULL
source(file.path(pvarA,'test.plot.fitEmaxB.R'),echo=TRUE)

RNGkind("default")
rm(list=objects())
if(file.exists("./clinDR/inst/tests/extraGraphics")){
	pvarA<-"./clinDR/inst/tests/extraGraphics"
} else pvarA<-NULL
source(file.path(pvarA,'test.plotB.R'),echo=TRUE)

RNGkind("default")
rm(list=objects())
if(file.exists("./clinDR/inst/tests/extraGraphics")){
	pvarA<-"./clinDR/inst/tests/extraGraphics"
} else pvarA<-NULL
source(file.path(pvarA,'test.plotD.R'),echo=TRUE)
