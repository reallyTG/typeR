library(rvalues)


### Name: rvalueBoot
### Title: Bootstrapped r-values
### Aliases: rvalueBoot
### Keywords: htest models

### ** Examples

## Not run: 
##D n <- 3000
##D theta <- rnorm(n, sd = 3)
##D ses <- sqrt(rgamma(n, shape = 10, rate = 1))
##D XX <- theta + ses*rnorm(n)
##D dd <- cbind(XX,ses)
##D 
##D rv <- rvalues(dd, family = gaussian, prior = "conjugate")
##D 
##D rvb <- rvalueBoot(rv, R = 10) 
##D summary(rvb$rval.repmat[512,])
## End(Not run)



