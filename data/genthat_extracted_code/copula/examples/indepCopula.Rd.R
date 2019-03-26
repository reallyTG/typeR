library(copula)


### Name: indepCopula
### Title: Construction of Independence Copula Objects
### Aliases: indepCopula
### Keywords: distribution multivariate

### ** Examples

indep.cop <- indepCopula(3)
x <- rCopula(10, indep.cop)
dCopula(x, indep.cop)
persp(indepCopula(), pCopula)



