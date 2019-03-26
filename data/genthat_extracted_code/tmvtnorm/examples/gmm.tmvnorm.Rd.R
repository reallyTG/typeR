library(tmvtnorm)


### Name: gmm.tmvnorm
### Title: GMM Estimation for the Truncated Multivariate Normal
###   Distribution
### Aliases: gmm.tmvnorm

### ** Examples

## Not run: 
##D set.seed(1.234)
##D 
##D # the actual parameters
##D lower <- c(-1, -2)
##D upper <- c(3, Inf)
##D mu    <- c(0, 0)
##D sigma <- matrix(c(1, 0.8,
##D                 0.8, 2), 2, 2)
##D                
##D # generate random samples               
##D X <- rtmvnorm(n=500, mu, sigma, lower, upper)
##D 
##D # estimate mean vector and covariance matrix sigma from random samples X
##D # with default start values
##D gmm.fit1 <- gmm.tmvnorm(X, lower=lower, upper=upper)
##D 
##D # diagnostic output of the estimated parameters
##D summary(gmm.fit1)
##D vcov(gmm.fit1)
##D 
##D # confidence intervals
##D confint(gmm.fit1)
##D 
##D # choosing a different start value
##D gmm.fit2 <- gmm.tmvnorm(X, lower=lower, upper=upper, 
##D   start=list(mu=c(0.1, 0.1), 
##D   sigma=matrix(c(1, 0.4, 0.4, 1.8),2,2)))
##D summary(gmm.fit2)
##D 
##D # GMM estimation with Lee (1983) moment conditions
##D gmm.fit3 <- gmm.tmvnorm(X, lower=lower, upper=upper, method="Lee")
##D summary(gmm.fit3)
##D confint(gmm.fit3)
##D 
##D # MLE estimation for comparison
##D mle.fit1 <- mle.tmvnorm(X, lower=lower, upper=upper)
##D confint(mle.fit1)
## End(Not run)



