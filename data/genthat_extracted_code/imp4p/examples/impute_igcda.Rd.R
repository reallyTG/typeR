library(imp4p)


### Name: impute.igcda
### Title: Imputing missing values by assuming that the distribution of
###   complete values is Gaussian in each column of an input matrix. This
###   algorithm is named "Imputation under a Gaussian Complete Data
###   Assumption" (IGCDA).
### Aliases: impute.igcda
### Keywords: Imputation methods

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600);

#Imputation of missing values with a MCAR-devoted algorithm: here the slsa algorithm
dat.slsa=impute.slsa(tab=res.sim$dat.obs,conditions=res.sim$condition,repbio=res.sim$repbio);

#Imputation of missing values under a Gaussian assumption
dat.gauss=impute.igcda(tab=res.sim$dat.obs, tab.imp=dat.slsa, conditions=res.sim$conditions);
## End(No test)



