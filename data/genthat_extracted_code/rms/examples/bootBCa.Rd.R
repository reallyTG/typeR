library(rms)


### Name: bootBCa
### Title: BCa Bootstrap on Existing Bootstrap Replicates
### Aliases: bootBCa
### Keywords: bootstrap

### ** Examples

## Not run: 
##D x1 <- runif(100); x2 <- runif(100); y <- sample(0:1, 100, TRUE)
##D f <- lrm(y ~ x1 + x2, x=TRUE, y=TRUE)
##D seed <- .Random.seed
##D b <- bootcov(f)
##D # Get estimated log odds at x1=.4, x2=.6
##D X <- cbind(c(1,1), x1=c(.4,2), x2=c(.6,3))
##D est <- X ##D 
##D ests <- t(X ##D 
##D bootBCa(est, ests, n=100, seed=seed)
##D bootBCa(est, ests, type='bca', n=100, seed=seed)
##D bootBCa(est, ests, type='basic', n=100, seed=seed)
## End(Not run)


