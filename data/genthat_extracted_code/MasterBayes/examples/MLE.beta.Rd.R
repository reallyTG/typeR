library(MasterBayes)


### Name: MLE.beta
### Title: Maximum Likelihood Estimation of Beta
### Aliases: MLE.beta
### Keywords: models optimize

### ** Examples

## Not run: 
##D data(WarblerP)
##D data(WarblerG)
##D 
##D GdP<-GdataPed(WarblerG)
##D 
##D res1<-expression(varPed("offspring", restrict=0))
##D var1<-expression(varPed(c("lat", "long"), gender="Male", 
##D   relational="OFFSPRING"))
##D res2<-expression(varPed("terr", gender="Female", relational="OFFSPRING",
##D   restrict="=="))
##D 
##D PdP<-PdataPed(formula=list(var1,res1,res2), data=WarblerP, USsire=FALSE)
##D 
##D X.list<-getXlist(PdP=PdP, GdP=GdP, E2=0.005)
##D 
##D ped<-MLE.ped(X.list)$P
##D beta<-MLE.beta(X.list, ped) 
##D beta
## End(Not run)



