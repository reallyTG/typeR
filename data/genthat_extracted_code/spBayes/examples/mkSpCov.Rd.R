library(spBayes)


### Name: mkSpCov
### Title: Function for calculating univariate and multivariate covariance
###   matrices
### Aliases: mkSpCov
### Keywords: utilities

### ** Examples

## Not run: 
##D ##A bivariate spatial covariance matrix
##D 
##D n <- 2 ##number of locations
##D q <- 2 ##number of responses at each location
##D nltr <- q*(q+1)/2 ##number of triangular elements in the cross-covariance matrix
##D 
##D coords <- cbind(runif(n,0,1), runif(n,0,1))
##D 
##D ##spatial decay parameters
##D theta <- rep(6,q)
##D 
##D A <- matrix(0,q,q)
##D A[lower.tri(A,TRUE)] <- rnorm(nltr, 5, 1)
##D K <- A%*%t(A)
##D 
##D Psi <- diag(1,q)
##D 
##D C <- mkSpCov(coords, K, Psi, theta, cov.model="exponential")
## End(Not run)



