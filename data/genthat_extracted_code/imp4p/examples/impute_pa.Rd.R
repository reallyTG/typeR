library(imp4p)


### Name: impute.pa
### Title: Imputation of peptides having no value in a biological condition
###   (present in a condition / absent in another).
### Aliases: impute.pa
### Keywords: Imputation methods

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600);

#Imputation of the simulated data set with small values
data.small.val=impute.pa(res.sim$dat.obs,res.sim$conditions);
## End(No test)



