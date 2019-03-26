library(RcppSMC)


### Name: nonLinPMMH
### Title: Particle marginal Metropolis-Hastings for a non-linear state
###   space model.
### Aliases: nonLinPMMH
### Keywords: programming

### ** Examples

## Not run: 
##D sim <- simNonlin(len=500,var_init=5,var_evol=10,var_obs=1,cosSeqOffset=0)
##D res <- nonLinPMMH(sim$data,particles=5000,iterations=50000,burnin=10000,plot=TRUE)
## End(Not run)




