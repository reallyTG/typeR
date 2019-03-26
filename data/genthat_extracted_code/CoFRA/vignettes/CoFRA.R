## ------------------------------------------------------------------------
library(CoFRA)

## ------------------------------------------------------------------------
data("iBAQ")
str(iBAQ)

## ------------------------------------------------------------------------
Fac=factor(c("MCCTT","MCCTT","MCCTT","MCCT","MCCT","MCCT","MC","MC","MC","MCT","MCT","MCT","MTT","MTT","MTT","MT","MT","MT","sN","sN","sN","sNT","sNT","sNT","iN","iN","iN","iNT","iNT","iNT"))

## ------------------------------------------------------------------------
dfComp=data.frame(Con=c("MCCT","MT","MC","iN","sN","AllC,MCCT,MT,MC,iN,sN"),Tre=c("MCCTT","MTT","MCT","iNT","sNT","AllT,MCCTT,MTT,MCT,iNT,sNT"))

## ----eval=FALSE----------------------------------------------------------
#  Func=CoFRA::getFunctionalCategories("CC")
#  str(Func)
#  CC1=CoFRA::completeFunctionalRegulationAnalysis(iBAQ,Func,Fac,dfComp,no_cores =-1)
#  CoFRA::HeatMapEnrichment(CC1,"CC")

## ----eval=FALSE----------------------------------------------------------
#  getwd() # check that the following commands don't overwrite any files
#  pdf("CC.pdf")
#  CoFRA::HeatMapEnrichment(CC1,"CC")
#  dev.off()

## ----eval=FALSE----------------------------------------------------------
#  plot(CC1)
#  summary(CC1)

## ----eval=FALSE----------------------------------------------------------
#  Func=CoFRA::getFunctionalCategories("MF")
#  str(Func)
#  MF1=CoFRA::completeFunctionalRegulationAnalysis(iBAQ,Func,Fac,dfComp)
#  CoFRA::HeatMapEnrichment(MF1,"MF")

## ----eval=FALSE----------------------------------------------------------
#  Func=CoFRA::getFunctionalCategories("BP")
#  str(Func)
#  BP1=CoFRA::completeFunctionalRegulationAnalysis(iBAQ,Func,Fac,dfComp)
#  CoFRA::HeatMapEnrichment(BP1,"BP")

