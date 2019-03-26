library(VineCopula)


### Name: BiCopDeriv
### Title: Derivatives of a Bivariate Copula Density
### Aliases: BiCopDeriv

### ** Examples


## simulate from a bivariate Student-t copula
set.seed(123)
cop <- BiCop(family = 2, par = -0.7, par2 = 4)
simdata <- BiCopSim(100, cop)

## derivative of the bivariate t-copula with respect to the first parameter
u1 <- simdata[,1]
u2 <- simdata[,2]
BiCopDeriv(u1, u2, cop, deriv = "par")

## estimate a Student-t copula for the simulated data
cop <- BiCopEst(u1, u2, family = 2)
## and evaluate its derivative w.r.t. the second argument u2
BiCopDeriv(u1, u2, cop, deriv = "u2")




