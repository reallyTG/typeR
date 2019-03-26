library(tmvtnorm)


### Name: mle.tmvnorm
### Title: Maximum Likelihood Estimation for the Truncated Multivariate
###   Normal Distribution
### Aliases: mle.tmvnorm

### ** Examples

## Not run: 
##D set.seed(1.2345)
##D 
##D # the actual parameters
##D lower <- c(-1,-1)
##D upper <- c(1, 2)
##D mu    <- c(0, 0)
##D sigma <- matrix(c(1, 0.7,
##D                0.7, 2), 2, 2)
##D                
##D # generate random samples               
##D X <- rtmvnorm(n=500, mu, sigma, lower, upper)
##D method <- "BFGS"
##D 
##D # estimate mean vector and covariance matrix sigma from random samples X
##D # with default start values
##D mle.fit1 <- mle.tmvnorm(X, lower=lower, upper=upper)
##D 
##D # diagnostic output of the estimated parameters
##D summary(mle.fit1)
##D logLik(mle.fit1)
##D vcov(mle.fit1)
##D 
##D # profiling the log likelihood and confidence intervals
##D mle.profile1 <- profile(mle.fit1, X, method="BFGS", trace=TRUE)
##D confint(mle.profile1)
##D 
##D par(mfrow=c(3,2))
##D plot(mle.profile1)
##D 
##D # choosing a different start value
##D mle.fit2 <- mle.tmvnorm(X, lower=lower, upper=upper, 
##D   start=list(mu=c(0.1, 0.1), 
##D   sigma=matrix(c(1, 0.4, 0.4, 1.8),2,2)))
##D summary(mle.fit2)
## End(Not run)



