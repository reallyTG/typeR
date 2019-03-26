library(VineCopula)


### Name: BiCopHfunc
### Title: Conditional Distribution Function of a Bivariate Copula
### Aliases: BiCopHfunc BiCopHfunc1 BiCopHfunc2

### ** Examples

data(daxreturns)

# h-functions of the Gaussian copula
cop <- BiCop(family = 1, par = 0.5)
h <- BiCopHfunc(daxreturns[, 2], daxreturns[, 1], cop)
## Don't show: 
h
## End(Don't show)
# or using the fast versions
h1 <- BiCopHfunc1(daxreturns[, 2], daxreturns[, 1], cop)
h2 <- BiCopHfunc2(daxreturns[, 2], daxreturns[, 1], cop)
all.equal(h$hfunc1, h1)
all.equal(h$hfunc2, h2)




