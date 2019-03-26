library(pracma)


### Name: bisect
### Title: Rootfinding Through Bisection or Secant Rule
### Aliases: bisect secant regulaFalsi
### Keywords: math

### ** Examples

bisect(sin, 3.0, 4.0)
# $root             $f.root             $iter   $estim.prec
# 3.1415926536      1.2246467991e-16    52      4.4408920985e-16

bisect(sin, -1.0, 1.0)
# $root             $f.root             $iter   $estim.prec
# 0                 0                   2       0

# Legendre polynomial of degree 5
lp5 <- c(63, 0, -70, 0, 15, 0)/8
f <- function(x) polyval(lp5, x)
bisect(f, 0.6, 1)       # 0.9061798453      correct to 15 decimals
secant(f, 0.6, 1)       # 0.5384693         different root
regulaFalsi(f, 0.6, 1)  # 0.9061798459      correct to 10 decimals



