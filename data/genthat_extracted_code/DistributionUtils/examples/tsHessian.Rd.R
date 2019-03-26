library(DistributionUtils)


### Name: tsHessian
### Title: Calculate Two-Sided Hessian Approximation
### Aliases: tsHessian
### Keywords: math

### ** Examples

### Consider Hessian of log(1 + x + 2y)
### Example from Lang: A Second Course in Calculus, p.74
fun <- function(param){
  x <- param[1]
  y <- param[2]
  return(log(1 + x + 2*y))
}

### True value of Hessian at (0,0)
trueHessian <- matrix( c(-1,-2,
                         -2,-4), byrow = 2, nrow = 2)
trueHessian

### Value from tsHessian
approxHessian <- tsHessian(c(0,0), fun = fun)
approxHessian
maxDiff <- max(abs(trueHessian - approxHessian))
### Should be approximately 0.045
maxDiff




