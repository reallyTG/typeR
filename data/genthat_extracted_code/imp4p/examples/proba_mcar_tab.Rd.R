library(imp4p)


### Name: prob.mcar.tab
### Title: Estimation of a matrix of probabilities that missing values are
###   MCAR.
### Aliases: prob.mcar.tab
### Keywords: Missing value analysis

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600,para=5);

#Imputation of missing values with a MCAR-devoted algorithm: here the slsa algorithm
dat.slsa=impute.slsa(tab=res.sim$dat.obs,conditions=res.sim$condition,repbio=res.sim$repbio);

#Estimation of the mixture model
res=estim.mix(tab=res.sim$dat.obs, tab.imp=dat.slsa, conditions=res.sim$condition);

#Computing probabilities to be MCAR
born=estim.bound(tab=res.sim$dat.obs,conditions=res.sim$condition);
proba=prob.mcar.tab(born$tab.lower,born$tab.upper,res);

#Histogram of probabilities to be MCAR associated to generated MCAR values
hist(proba[res.sim$list.MCAR[[1]],1],

freq=FALSE,main="Estimated probabilities to be MCAR for known MCAR values",xlab="",col=2);

#Histogram of probabilities to be MCAR associated to generated MNAR values
hist(

proba[which(is.na(res.sim$dat.obs[,1]))[

!which(is.na(res.sim$dat.obs[,1]))%in%res.sim$list.MCAR[[1]]],1

],

freq=FALSE,main="Estimated probabilities to be MCAR for known MNAR values",xlab="",col=4
);
## End(No test)



