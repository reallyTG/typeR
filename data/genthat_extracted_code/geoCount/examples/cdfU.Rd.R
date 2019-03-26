library(geoCount)


### Name: cdfU
### Title: Approximate the CDF Value from Reference Samples
### Aliases: cdfU
### Keywords: Transformed Residual Checking

### ** Examples

## Not run: 
##D Y.obs <- 11:20
##D res <- matrix(0, 10, 50)
##D for(i in 1:50){
##D Y.rep <- matrix(rpois(10*5000, 15), 10, )
##D res[, i] <- cdfU(Y.obs, Y.rep)
##D }
##D matplot(t(res), type="l")
##D abline(h = ppois(11:20, 15))
## End(Not run)



