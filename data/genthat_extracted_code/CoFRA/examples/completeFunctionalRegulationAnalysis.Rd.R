library(CoFRA)


### Name: completeFunctionalRegulationAnalysis
### Title: This function performs complete functional regulation analysis
### Aliases: completeFunctionalRegulationAnalysis
### Keywords: heatmap

### ** Examples

library(CoFRA)
data(iBAQ)
Fac=factor(c("MCCTT","MCCTT","MCCTT","MCCT","MCCT","MCCT","MC","MC","MC","MCT","MCT","MCT",
"MTT","MTT","MTT","MT","MT","MT","sN","sN","sN","sNT","sNT","sNT","iN","iN","iN","iNT","iNT","iNT"))
dfComp=data.frame(Con=c("MCCT","MT","MC","iN","sN","AllC,MCCT,MT,MC,iN,sN"),Tre=c("MCCTT","MTT",
"MCT","iNT","sNT","AllT,MCCTT,MTT,MCT,iNT,sNT"))
Func=CoFRA::getFunctionalCategories("CC")
head(str(Func))
CC1=CoFRA::completeFunctionalRegulationAnalysis(iBAQ,Func[100:200],Fac,dfComp,NbackGround=142140) 



