library(pracma)


### Name: quadgk
### Title: Adaptive Gauss-Kronrod Quadrature
### Aliases: quadgk
### Keywords: math

### ** Examples

##  Dilogarithm function
flog <- function(t) log(1-t)/t
quadgk(flog, 1, 0, tol = 1e-12)
# 1.644934066848128 - pi^2/6 < 1e-13



