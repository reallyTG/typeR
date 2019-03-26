library(nlshrink)


### Name: linshrink_cov
### Title: Linear-shrinkage estimator of population covariance matrix.
### Aliases: linshrink_cov

### ** Examples

linshrink_cov(X = matrix(rnorm(1e4, mean = 5), nrow = 100, ncol = 100)) # 1 class; will be centered
linshrink_cov(X = matrix(rnorm(1e4), nrow = 100, ncol = 100), k = 1) # 1 class; no centering



