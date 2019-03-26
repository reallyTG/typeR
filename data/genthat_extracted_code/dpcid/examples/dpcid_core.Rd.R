library(dpcid)


### Name: dpcid_core
### Title: Identification of two partial correlation matrices having sparse
###   differences
### Aliases: dpcid_core

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

A = scale(X1,center=TRUE,scale=FALSE)
B = scale(X2,center=TRUE,scale=FALSE)

lambda1 = 1
lambda2 = 1

shr_res = lshr.cov(A)
PM1 = shr_res$shr_inv

shr_res = lshr.cov(B)
PM2 = shr_res$shr_inv

wd1 = diag(PM1)
wd2 = diag(PM2)

rho1_init = -(1/sqrt(wd1))*PM1
rho1_init = t( 1/sqrt(wd1)*t(rho1_init))
diag(rho1_init) = 1

rho2_init = -(1/sqrt(wd2))*PM2
rho2_init = t( 1/sqrt(wd2)*t(rho2_init))
diag(rho2_init) = 1

res = dpcid_core(A, B, lambda1, lambda2, wd1,wd2, rho1_init, rho2_init)
    



