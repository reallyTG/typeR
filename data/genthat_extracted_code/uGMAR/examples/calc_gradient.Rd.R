library(uGMAR)


### Name: calc_gradient
### Title: Calculate gradient or Hessian matrix
### Aliases: calc_gradient calc_hessian get_gradient get_hessian

### ** Examples

 # Simple function
 foo <- function(x) x^2 + x
 calc_gradient(x=1, fn=foo)
 calc_gradient(x=-0.5, fn=foo)

 # More complicated function
 foo <- function(x, a, b) a*x[1]^2 - b*x[2]^2
 calc_gradient(x=c(1, 2), fn=foo, a=0.3, b=0.1)

 # GMAR model:
 params12 <- c(1.12321, 0.90557, 0.29288,
  4.53131, 0.70309, 3.21154, 0.83888)
 gmar12 <- GSMAR(VIX, 1, 2, params12)
 get_gradient(gmar12)
 get_hessian(gmar12)



