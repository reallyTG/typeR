library(hierband)


### Name: hierband
### Title: Solves main optimization problem for fixed lambda value
### Aliases: hierband

### ** Examples

set.seed(123)
p <- 100
n <- 50
K <- 10
true <- ma(p, K)
x <- matrix(rnorm(n*p), n, p) %*% true$A
Sighat <- cov(x)
fit <- hierband(Sighat, lam=0.4)
min(eigen(fit)$values)
fit2 <- hierband(Sighat, lam=0.4, delta=0.2)
min(eigen(fit2)$values)
# Use cross validation to select lambda:
path <- hierband.path(Sighat)
cv <- hierband.cv(path, x)
fit <- hierband(Sighat, lam=cv$lam.best)



