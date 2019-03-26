library(rootSolve)


### Name: hessian
### Title: Estimates the hessian matrix
### Aliases: hessian
### Keywords: math

### ** Examples

## =======================================================================
## the banana function
## =======================================================================
   fun <- function(x)  100*(x[2] - x[1]^2)^2 + (1 - x[1])^2
   mm  <- nlm(fun, p = c(0, 0))$estimate
   (Hes <- hessian(fun, mm))
   # can also be estimated by nlm(fun, p=c(0,0), hessian=TRUE)
   solve(Hes)   # estimate of parameter uncertainty



