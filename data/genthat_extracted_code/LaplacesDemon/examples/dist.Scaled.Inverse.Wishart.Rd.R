library(LaplacesDemon)


### Name: dist.Scaled.Inverse.Wishart
### Title: Scaled Inverse Wishart Distribution
### Aliases: dsiw rsiw
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
### In the model specification function, input U and zeta, then:
# Q <- t(U) %*% U
# Zeta <- diag(zeta)
# Sigma <- Zeta %*% Q %*% Zeta
# Sigma.prior <- dsiw(Q, nu=Data$K+1, S=diag(Data$K), zeta, mu=0, delta=1)
### Examples
x <- dsiw(diag(3), 4, diag(3), runif(3), rep(0,3), rep(1,3), log=TRUE)
x <- rsiw(4, diag(3), rep(0,3), rep(1,3))



