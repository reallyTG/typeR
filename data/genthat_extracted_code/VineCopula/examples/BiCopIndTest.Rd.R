library(VineCopula)


### Name: BiCopIndTest
### Title: Independence Test for Bivariate Copula Data
### Aliases: BiCopIndTest

### ** Examples

## Don't show: 
set.seed(123)
## End(Don't show)
## Example 1: Gaussian copula with large dependence parameter
cop <- BiCop(1, 0.7)
dat <- BiCopSim(500, cop)

# perform the asymptotic independence test
BiCopIndTest(dat[, 1], dat[, 2])

## Example 2: Gaussian copula with small dependence parameter
cop <- BiCop(1, 0.01)
dat <- BiCopSim(500, cop)

# perform the asymptotic independence test
BiCopIndTest(dat[, 1], dat[, 2])




