library(PEIP)


### Name: Ainv
### Title: An Inverse Solution
### Aliases: Ainv
### Keywords: misc

### ** Examples

set.seed(2015)
GAB = matrix(runif(36), ncol=6)
truex =rnorm(ncol(GAB))
rhs = GAB %*% truex

rhs = as.vector(rhs )

tout = Ainv(GAB, rhs, tol = 1e-12)
tout - truex 




