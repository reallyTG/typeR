library(quadrupen)


### Name: plot,quadrupen-method
### Title: Plot method for a quadrupen object
### Aliases: plot,quadrupen-method

### ** Examples

## Not run: 
##D ## Simulating multivariate Gaussian with blockwise correlation
##D ## and piecewise constant vector of parameters
##D beta <- rep(c(0,1,0,-1,0), c(25,10,25,10,25))
##D cor <- 0.75
##D Soo <- toeplitz(cor^(0:(25-1))) ## Toeplitz correlation for irrelevant variables
##D Sww  <- matrix(cor,10,10) ## bloc correlation between active variables
##D Sigma <- bdiag(Soo,Sww,Soo,Sww,Soo)
##D diag(Sigma) <- 1
##D n <- 50
##D x <- as.matrix(matrix(rnorm(95*n),n,95) %*% chol(Sigma))
##D y <- 10 + x %*% beta + rnorm(n,0,10)
##D 
##D ## Plot the Lasso path
##D plot(elastic.net(x,y, lambda2=0), main="Lasso solution path")
##D ## Plot the Elastic-net path
##D plot(enet, main = "Elastic-net solution path")
##D ## Plot the Elastic-net path (fraction on X-axis, unstandardized coefficient)
##D plot(elastic.net(x,y, lambda2=10), standardize=FALSE, xvar="fraction")
##D ## Plot the Bounded regression path (fraction on X-axis)
##D plot(bounded.reg(x,y, lambda2=10), xvar="fraction")
## End(Not run)




