library(CondReg)


### Name: condreg
### Title: Compute the condition number with given penalty parameter
### Aliases: condreg

### ** Examples

## True covariance matrix
sigma <- diag(5)
sigma[3,2] <- sigma[2,3] <- 0.8

## Generate normal random samples
## Not run: 
##D library(MASS)
##D X <- mvrnorm(200,rep(0,5),sigma)
##D 
##D ## Covariance estimation
##D crcov <- condreg(X,3)
##D 
##D ## Inspect output
##D str(crcov)              ## returned object
##D sigma.hat <- crcov$S    ## estimate of sigma matrix
##D omega.hat <- crcov$invS ## estimate of inverse of sigma matrix
## End(Not run)



