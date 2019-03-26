library(MasterBayes)


### Name: MLE.ped
### Title: Maximum Likelihood Estimation of the Pedigree
### Aliases: MLE.ped
### Keywords: models optimize

### ** Examples

## Not run: 
##D data(WarblerP)
##D data(WarblerG)
##D 
##D GdP<-GdataPed(WarblerG)
##D 
##D res1<-expression(varPed("offspring", restrict=0))
##D res2<-expression(varPed("terr", gender="Female", relational="OFFSPRING", 
##D   restrict="=="))
##D 
##D PdP<-PdataPed(formula=list(res1,res2), data=WarblerP, USsire=TRUE)
##D 
##D X.list<-getXlist(PdP=PdP, GdP=GdP, E2=0.005)
##D 
##D ped<-MLE.ped(X.list, USsire=TRUE, nUSsire=10, threshold=0.75)
## End(Not run)



