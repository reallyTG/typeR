library(mdw)


### Name: asym.v.v
### Title: Asymptotic variance for maximum variance weights
### Aliases: asym.v.v
### Keywords: weighting

### ** Examples

library(MASS)
# a three biomarkers dataset generated from independent normal(0,1)
X = mvrnorm(n = 100, mu=rep(0,3), Sigma=diag(3), tol = 1e-6, empirical = FALSE, EISPACK = FALSE)
w <- var.weight(X)
asym.v.v(X,w)



