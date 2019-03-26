library(osDesign)


### Name: rmvhyper
### Title: Random generation for the multivariate hypergeometric
###   distribution
### Aliases: rmvhyper

### ** Examples

##
rmvhyper(c(1000, 500, 200, 50), 200)

## Not run: 
##D ## Check the properties (first two moments) of the generated deviates
##D ##
##D M  <- 100
##D Qx <- c(0.7, 0.15, 0.1, 0.05)
##D temp <- matrix(NA, nrow=100000, ncol=length(Qx))
##D for(i in 1:nrow(temp)) temp[i,] <- rmvhyper(M*Qx, 1)
##D 
##D ##
##D rbind(Qx, apply(temp, 2,  mean))
##D rbind(sqrt(Qx * (1-Qx)), apply(temp, 2, sd))
## End(Not run)



