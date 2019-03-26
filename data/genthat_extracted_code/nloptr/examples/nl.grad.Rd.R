library(nloptr)


### Name: nl.grad
### Title: Numerical Gradients and Jacobians
### Aliases: nl.grad nl.jacobian

### ** Examples


  fn1 <- function(x) sum(x^2)
  nl.grad(seq(0, 1, by = 0.2), fn1)
  ## [1] 0.0  0.4  0.8  1.2  1.6  2.0
  nl.grad(rep(1, 5), fn1)
  ## [1] 2  2  2  2  2

  fn2 <- function(x) c(sin(x), cos(x))
  x <- (0:1)*2*pi
  nl.jacobian(x, fn2)
  ##      [,1] [,2]
  ## [1,]    1    0
  ## [2,]    0    1
  ## [3,]    0    0
  ## [4,]    0    0




