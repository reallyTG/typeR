library(propagate)


### Name: numDerivs
### Title: Functions for creating Gradient and Hessian matrices by
###   numerical differentiation (Richardson's method) of the partial
###   derivatives
### Aliases: numGrad numHess
### Keywords: array algebra multivariate

### ** Examples

## Check for equality of symbolic  
## and numerical derivatives.
EXPR <- expression(2^x + sin(2 * y) - cos(z))
x <- 5
y <- 10
z <- 20

symGRAD <- evalDerivs(makeGrad(EXPR))
numGRAD <- numGrad(EXPR)
all.equal(symGRAD, numGRAD)

symHESS <- evalDerivs(makeHess(EXPR))
numHESS <- numHess(EXPR)
all.equal(symHESS, numHESS)



