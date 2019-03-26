library(nlshrink)


### Name: nlshrink_cov
### Title: Non-linear shrinkage estimator of population covariance matrix.
### Aliases: nlshrink_cov

### ** Examples

# generate matrix of uniform random variates
X <- matrix(sapply(1:20, function(b) runif(50, max=b)), nrow = 50, ncol = 20)
Sigma <- diag((1:20)^2/12) # true population covariance matrix
nlshrink_X <- nlshrink_cov(X, k=0) # compute non-linear shrinkage estimate
linshrink_X <- linshrink_cov(X, k=0) # compute linear shrinkage estimate
S <- cov(X) # sample covariance matrix

# compare accuracy of estimators (sum of squared elementwise Euclidean distance)
sum((S-Sigma)^2)
sum((nlshrink_X - Sigma)^2)
sum((linshrink_X - Sigma)^2)




