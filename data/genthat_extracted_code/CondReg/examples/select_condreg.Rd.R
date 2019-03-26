library(CondReg)


### Name: select_condreg
### Title: Compute the best condition number regularized based based on
###   cross-validation selected penalty parameter
### Aliases: select_condreg

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
##D gridpts <- kgrid(50,100)           ## generate grid of penalties to search over
##D crcov <- select_condreg(X,gridpts) ## automatically selects penalty parameter
##D 
##D ## Inspect output
##D str(crcov)              ## returned object
##D sigma.hat <- crcov$S    ## estimate of sigma matrix
##D omega.hat <- crcov$invS ## estimate of inverse of sigma matrix
## End(Not run)



