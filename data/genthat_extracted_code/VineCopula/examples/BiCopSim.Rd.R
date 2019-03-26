library(VineCopula)


### Name: BiCopSim
### Title: Simulation from a Bivariate Copula
### Aliases: BiCopSim

### ** Examples

# simulate from a bivariate t-copula
simdata <- BiCopSim(100, 2, -0.7, par2 = 4)

# or alternatively
obj <- BiCop(family = 2, par = -0.7, par2 = 4)
simdata2 <- BiCopSim(100, obj)




