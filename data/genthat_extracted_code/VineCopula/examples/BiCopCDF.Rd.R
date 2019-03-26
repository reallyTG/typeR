library(VineCopula)


### Name: BiCopCDF
### Title: Distribution Function of a Bivariate Copula
### Aliases: BiCopCDF

### ** Examples

## simulate from a bivariate Clayton copula
set.seed(123)
cop <- BiCop(family = 3, par = 3.4)
simdata <- BiCopSim(300, cop)

## evaluate the distribution function of the bivariate Clayton copula
u1 <- simdata[,1]
u2 <- simdata[,2]
BiCopCDF(u1, u2, cop)

## select a bivariate copula for the simulated data
cop <- BiCopSelect(u1, u2)
summary(cop)
## and evaluate its CDF
BiCopCDF(u1, u2, cop)




