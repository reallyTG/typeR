library(mdw)


### Name: entropy.weight
### Title: Maximum entropy weights
### Aliases: entropy.weight
### Keywords: weighting

### ** Examples

library(MASS)
# a three biomarkers dataset generated from independent normal(0,1)
X = mvrnorm(n = 100, mu=rep(0,3), Sigma=diag(3), tol = 1e-6, empirical = FALSE, EISPACK = FALSE)
entropy.weight(X, h=1)



