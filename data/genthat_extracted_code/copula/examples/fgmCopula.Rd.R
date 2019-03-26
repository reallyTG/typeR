library(copula)


### Name: fgmCopula
### Title: Construction of a fgmCopula Class Object
### Aliases: fgmCopula
### Keywords: distribution multivariate

### ** Examples

## a bivariate example
fgm.cop <- fgmCopula(1)
x <- rCopula(1000, fgm.cop)
cor(x, method = "kendall")
tau(fgm.cop)
cor(x, method = "spearman")
rho(fgm.cop)
persp  (fgm.cop, dCopula)
contour(fgm.cop, dCopula)

## a trivariate example with wrong parameter values
try(
 fgm2.cop <- fgmCopula(c(1,1,1,1), dim = 3)
) # Error: "Bad vector of parameters"

## a trivariate example with satisfactory parameter values
fgm2.cop <- fgmCopula(c(.2,-.2,-.4,.6), dim = 3)
fgm2.cop



