library(mdw)


### Name: asym.v.e
### Title: Asymptotic variance for maximum entropy weights
### Aliases: asym.v.e
### Keywords: weighting

### ** Examples

library(MASS)
# a three biomarkers dataset generated from independent normal(0,1)
X = mvrnorm(n = 100, mu=rep(0,3), Sigma=diag(3), tol = 1e-6, empirical = FALSE, EISPACK = FALSE)
h = 1
w <- entropy.weight(X,h)
asym.v.e(X,w,h)



