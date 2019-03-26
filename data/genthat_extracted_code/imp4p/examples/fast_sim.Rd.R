library(imp4p)


### Name: fast_sim
### Title: Function to compute similarity measures between a vector and
###   each row of a matrix.
### Aliases: fast_sim
### Keywords: Cpp wrapper function

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=20000,nb.miss=1000);

#Fast computation of similarities
fast_sim(res.sim$dat.obs[1,],res.sim$dat.obs);
## End(No test)



