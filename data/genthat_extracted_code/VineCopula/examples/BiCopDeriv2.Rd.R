library(VineCopula)


### Name: BiCopDeriv2
### Title: Second Derivatives of a Bivariate Copula Density
### Aliases: BiCopDeriv2

### ** Examples


## simulate from a bivariate Student-t copula
set.seed(123)
cop <- BiCop(family = 2, par = -0.7, par2 = 4)
simdata <- BiCopSim(100, cop)

## second derivative of the Student-t copula w.r.t. the first parameter
u1 <- simdata[,1]
u2 <- simdata[,2]
BiCopDeriv2(u1, u2, cop, deriv = "par")

## estimate a Student-t copula for the simulated data
cop <- BiCopEst(u1, u2, family = 2)
## and evaluate its second derivative w.r.t. the second argument u2
BiCopDeriv2(u1, u2, cop, deriv = "u2")




