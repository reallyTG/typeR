library(dpcid)


### Name: dpcid
### Title: Differential partial correlation identification with the ridge
###   and the fusion penalties
### Aliases: dpcid

### ** Examples

library(MASS)

## True precision matrix
omega1 <- matrix(0,5,5)
omega1[1,2] <- omega1[1,3] <- omega1[1,4] <- 1
omega1[2,3] <- omega1[3,4] <- 1.5
omega1 <- t(omega1) + omega1
diag(omega1) <- 3

omega2 <- matrix(0,5,5)
omega2[1,3] <- omega2[1,5] <- 1.5
omega2[2,3] <- omega2[2,4] <- 1.5
omega2 <- t(omega2) + omega2
diag(omega2) <- 3


Sig1 = solve(omega1)
Sig2 = solve(omega2)
X1 = mvrnorm(50,rep(0,5),Sig1)
X2 = mvrnorm(50,rep(0,5),Sig2)

lambda1 = 0.2
lambda2 = 0.2

res = dpcid(X1,X2,lambda1,lambda2,niter=1000,tol=1e-6)




