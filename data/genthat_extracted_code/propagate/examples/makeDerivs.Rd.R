library(propagate)


### Name: makeDerivs
### Title: Utility functions for creating Gradient- and Hessian-like
###   matrices with symbolic derivatives and evaluating them in an
###   environment
### Aliases: makeGrad makeHess evalDerivs
### Keywords: array algebra multivariate

### ** Examples

EXPR <- expression(a^b + sin(c))
ENVIR <- list(a = 2, b = 3, c = 4)

## First-order partial derivatives: Gradient.
GRAD <- makeGrad(EXPR) 

## This will evaluate the Gradient.
evalDerivs(GRAD, ENVIR)

## Second-order partial derivatives: Hessian.
HESS <- makeHess(EXPR) 

## This will evaluate the Hessian.
evalDerivs(HESS, ENVIR)

## Change derivatives order.
GRAD <- makeGrad(EXPR, order = c(2,1,3)) 
evalDerivs(GRAD, ENVIR)



