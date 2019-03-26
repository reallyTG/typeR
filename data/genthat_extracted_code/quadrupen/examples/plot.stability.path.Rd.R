library(quadrupen)


### Name: plot,stability.path-method
### Title: Plot method for 'stability.path'.
### Aliases: plot,stability.path-method

### ** Examples

## Not run: 
##D ## Simulating multivariate Gaussian with blockwise correlation
##D ## and piecewise constant vector of parameters
##D beta <- rep(c(0,1,0,-1,0), c(25,10,25,10,25))
##D Soo  <- matrix(0.75,25,25) ## bloc correlation between zero variables
##D Sww  <- matrix(0.75,10,10) ## bloc correlation between active variables
##D Sigma <- bdiag(Soo,Sww,Soo,Sww,Soo) + 0.2
##D diag(Sigma) <- 1
##D n <- 100
##D x <- as.matrix(matrix(rnorm(95*n),n,95) %*% chol(Sigma))
##D y <- 10 + x %*% beta + rnorm(n,0,10)
##D 
##D ## Build a vector of label for true nonzeros
##D labels <- rep("irrelevant", length(beta))
##D labels[beta != 0] <- c("relevant")
##D labels <- factor(labels, ordered=TRUE, levels=c("relevant","irrelevant"))
##D 
##D ## Call to stability selection function, 200 subsampling
##D stab <- stability(x,y, subsamples=200, lambda2=1, min.ratio=1e-2)
##D 
##D ## Build the plot an recover the selected variable
##D plot(stab, labels=labels)
##D plot(stab, xvar="fraction", labels=labels, sel.mode="PFER", cutoff=0.75, PFER=2)
## End(Not run)



