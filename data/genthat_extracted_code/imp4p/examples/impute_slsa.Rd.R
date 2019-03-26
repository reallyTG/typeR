library(imp4p)


### Name: impute.slsa
### Title: Imputing missing values using an adaptation of the LSimpute
###   algorithm (Bo et al. (2004)) to experimental designs. This algorithm
###   is named "Structured Least Squares Algorithm" (SLSA).
### Aliases: impute.slsa
### Keywords: Imputation methods

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600);

#Imputation of missing values with the slsa algorithm
dat.slsa=impute.slsa(tab=res.sim$dat.obs,conditions=res.sim$condition,repbio=res.sim$repbio);
## End(No test)



