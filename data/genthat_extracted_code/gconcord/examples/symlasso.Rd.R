library(gconcord)


### Name: symlasso
### Title: Symmetric Lasso (symlasso)
### Aliases: symlasso

### ** Examples

library(mvtnorm)

## True omega
omega <- matrix(0,3,3)
omega[1,2] <- omega[2,3] <- 2.1
omega <- t(omega) + omega
diag(omega) <- 3

sigma <- solve(omega)

## Generate data
set.seed(60)
data <- rmvnorm(100, rep(0,3), sigma)

## Solve
symlasso(data,2.1)



