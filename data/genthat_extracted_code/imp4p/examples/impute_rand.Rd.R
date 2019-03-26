library(imp4p)


### Name: impute.rand
### Title: Imputation of peptides with a random value.
### Aliases: impute.rand
### Keywords: Imputation methods

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600);

#Imputation of the simulated data set with random values
data.rand=impute.rand(res.sim$dat.obs,res.sim$conditions);
## End(No test)



