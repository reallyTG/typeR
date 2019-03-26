library(dpcid)


### Name: lshr.cov
### Title: Linear shrinkage estimates of covariance and inverse covariance
###   matrix
### Aliases: lshr.cov

### ** Examples

library(MASS)

## True precision matrix
omega <- matrix(0,5,5)
omega[1,2] <- omega[1,3] <- omega[1,4] <- 1
omega[2,3] <- omega[3,4] <- 1.5
omega <- t(omega) + omega
diag(omega) <- 3

Sig = solve(omega)
X = mvrnorm(50,rep(0,5),Sig)
lshr.cov(X)



