library(quadrupen)


### Name: crossval
### Title: Cross-validation function for quadrupen fitting methods.
### Aliases: crossval
### Keywords: models, regression

### ** Examples

## Not run: 
##D ## Simulating multivariate Gaussian with blockwise correlation
##D ## and piecewise constant vector of parameters
##D beta <- rep(c(0,1,0,-1,0), c(25,10,25,10,25))
##D cor  <- 0.75
##D Soo  <- toeplitz(cor^(0:(25-1))) ## Toeplitz correlation for irrelevant variable
##D Sww  <- matrix(cor,10,10) ## bloc correlation between active variables
##D Sigma <- bdiag(Soo,Sww,Soo,Sww,Soo) + 0.1
##D diag(Sigma) <- 1
##D n <- 100
##D x <- as.matrix(matrix(rnorm(95*n),n,95) %*% chol(Sigma))
##D y <- 10 + x %*% beta + rnorm(n,0,10)
##D 
##D ## Use fewer lambda1 values by overwritting the default parameters
##D ## and cross-validate over the sequences lambda1 and lambda2
##D cv.double <- crossval(x,y, lambda2=10^seq(2,-2,len=50), nlambda1=50)
##D ## Rerun simple cross-validation with the appropriate lambda2
##D cv.10K <- crossval(x,y, lambda2=slot(cv.double, "lambda2.min"))
##D ## Try leave one out also
##D cv.loo <- crossval(x,y, K=n, lambda2=slot(cv.double, "lambda2.min"))
##D 
##D plot(cv.double)
##D plot(cv.10K)
##D plot(cv.loo)
##D 
##D ## Performance for selection purpose
##D beta.min.10K <- slot(cv.10K, "beta.min")
##D beta.min.loo <- slot(cv.loo, "beta.min")
##D 
##D cat("\nFalse positives with the minimal 10-CV choice: ", sum(sign(beta) != sign(beta.min.10K)))
##D cat("\nFalse positives with the minimal LOO-CV choice: ", sum(sign(beta) != sign(beta.min.loo)))
## End(Not run)




