library(bayesSurv)


### Name: rMVNorm
### Title: Sample from the multivariate normal distribution
### Aliases: rMVNorm C_rmvnormR2006
### Keywords: distribution multivariate

### ** Examples

### Mean, covariance matrix, its inverse
### and the canonical mean
mu <- c(0, 2, 0.5)
L <- matrix(c(1, 1, 1,  0, 0.5, 0.5,  0, 0, 0.3), ncol=3)
Sigma <- L %*% t(L)
Q <- chol2inv(t(L))
b <- Q %*% mu

print(Sigma)
print(Q)
print(Sigma %*% Q)

### Sample using different parametrizations
set.seed(775988621)
n <- 10000

### Sample from N(mu, Sigma)
xx1 <- rMVNorm(n=n, mean=mu, Sigma=Sigma)
apply(xx1, 2, mean)
var(xx1)

### Sample from N(mu, Q^{-1})
xx2 <- rMVNorm(n=n, mean=mu, Q=Q)
apply(xx2, 2, mean)
var(xx2)

### Sample from N(Q^{-1}*b, Q^{-1})
xx3 <- rMVNorm(n=n, mean=b, Q=Q, param="canonical")
apply(xx3, 2, mean)
var(xx3)



