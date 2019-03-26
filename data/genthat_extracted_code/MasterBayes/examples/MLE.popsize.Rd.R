library(MasterBayes)


### Name: MLE.popsize
### Title: Maximum Likelihood Estimation of the Unsampled Population Size
### Aliases: MLE.popsize
### Keywords: models optimize

### ** Examples

## Not run: 
##D data(WarblerP)
##D data(WarblerG)
##D 
##D GdP<-GdataPed(WarblerG)
##D res1<-expression(varPed("offspring", restrict=0))
##D 
##D PdP<-PdataPed(formula=list(res1), data=WarblerP, USsire=TRUE, USdam=TRUE)
##D 
##D X.list<-getXlist(PdP=PdP, GdP=GdP, E2=0.02)
##D 
##D nUS<-MLE.popsize(X.list, USsire=TRUE, USdam=TRUE)
##D nUS
## End(Not run)



