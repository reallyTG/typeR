library(imp4p)


### Name: sim.data
### Title: Simulation of data sets by controlling the proportion of MCAR
###   values and the distribution of MNAR values.
### Aliases: sim.data
### Keywords: Simulated data

### ** Examples

## No test: 
## The function can be used as
res.sim=sim.data(nb.pept=2000,nb.miss=600);
## Simulated data matrix
data=res.sim$dat.obs;
## Vector of conditions of membership for each sample
cond=res.sim$conditions;
## Vector of biological sample of membership for each sample
repbio=res.sim$repbio;
## Percentage of generated MCAR values for each sample
pi_mcar=res.sim$nMCAR/res.sim$nNA
## End(No test)



