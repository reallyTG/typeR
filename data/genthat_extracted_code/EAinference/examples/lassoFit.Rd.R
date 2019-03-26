library(EAinference)


### Name: lassoFit
### Title: Compute lasso estimator
### Aliases: lassoFit

### ** Examples

set.seed(123)
n <- 50
p <- 10
X <- matrix(rnorm(n*p), n)
Y <- X %*% c(1, 1, rep(0, p-2)) + rnorm(n)
#
# lasso
#
lassoFit(X = X, Y = Y, type = "lasso", lbd = .5)
#
# group lasso
#
lassoFit(X = X, Y = Y, type = "grlasso", lbd = .5, weights = rep(1,2),
           group = rep(1:2, each=5))
#
# scaled lasso
#
lassoFit(X = X, Y = Y, type = "slasso", lbd = .5)
#
# scaled group lasso
#
lassoFit(X = X, Y = Y, type = "sgrlasso", lbd = .5, weights = rep(1,2),
           group = rep(1:2, each=5))



