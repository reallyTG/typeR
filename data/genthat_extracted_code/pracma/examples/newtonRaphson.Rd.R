library(pracma)


### Name: newtonRaphson
### Title: Rootfinding through Newton-Raphson or Secant.
### Aliases: newtonRaphson newton
### Keywords: math

### ** Examples

# Legendre polynomial of degree 5
lp5 <- c(63, 0, -70, 0, 15, 0)/8
f <- function(x) polyval(lp5, x)
newton(f, 1.0)         # 0.9061798459 correct to 10 decimals in 5 iterations



