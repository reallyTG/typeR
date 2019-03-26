library(quadrupen)


### Name: stability
### Title: Stability selection for a quadrupen fit.
### Aliases: stability
### Keywords: models, regression

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
##D ## Recover the selected variables for a given cutoff
##D ## and per-family error rate, without producing any plot
##D stabpath <- plot(stab, cutoff=0.75, PFER=1, plot=FALSE)
##D 
##D cat("\nFalse positives for the randomized Elastic-net with stability selection: ",
##D      sum(labels[stabpath$selected] != "relevant"))
##D cat("\nDONE.\n")
## End(Not run)



