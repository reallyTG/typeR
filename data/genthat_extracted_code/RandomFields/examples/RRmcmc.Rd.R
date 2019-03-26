library(RandomFields)


### Name: RRmcmc
### Title: Random Sample From The Modulus Of A Function
### Aliases: RRmcmc
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
## here a model with random scale parameter

## not exponential, but the Laplace distribution as symmetry is assumed
z <- RFrdistr(RRmcmc(RMexp(), sigma=1), n=10000, cores=1)
hist(z, 100, freq=FALSE)
curve(0.5 * exp(-abs(x)), add=TRUE, col="blue") ## Laplace distribution

## Don't show: 
FinalizeExample()
## End(Don't show)


