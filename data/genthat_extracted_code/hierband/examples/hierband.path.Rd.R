library(hierband)


### Name: hierband.path
### Title: Solves main optimization problem over a grid of lambda values
### Aliases: hierband.path

### ** Examples

set.seed(123)
p <- 100
n <- 50
K <- 10
true <- ma(p, K)
x <- matrix(rnorm(n*p), n, p) %*% true$A
Sighat <- cov(x)
path <- hierband.path(Sighat)
cv <- hierband.cv(path, x)
fit <- hierband(Sighat, lam=cv$lam.best)



