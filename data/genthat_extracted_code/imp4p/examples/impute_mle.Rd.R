library(imp4p)


### Name: impute.mle
### Title: Imputing missing values using a maximum likelihood estimation
###   (MLE).
### Aliases: impute.mle
### Keywords: Imputation methods

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600,nb.cond=2);

#Imputation of missing values with the slsa algorithm
dat.mle=impute.mle(tab=res.sim$dat.obs,conditions=res.sim$condition);
## End(No test)



