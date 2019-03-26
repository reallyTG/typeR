library(pracma)


### Name: polyApprox
### Title: Polynomial Approximation
### Aliases: polyApprox
### Keywords: math

### ** Examples

##  Example
#   Polynomial approximation for sin
polyApprox(sin, -pi, pi, 9)
# $p
#  [1]  2.197296e-06  0.000000e+00 -1.937495e-04  0.000000e+00  8.317144e-03
#  [6]  0.000000e+00 -1.666468e-01  0.000000e+00  9.999961e-01  0.000000e+00
#
# $f
# function (x) 
# polyval(p, x)
#
# $cheb.coeff
#  [1]  0.06549943  0.00000000 -0.58518036  0.00000000  2.54520983  0.00000000
#  [7] -5.16709776  0.00000000  3.14158037  0.00000000
#
# $estim.prec
# [1] 1.151207e-05

## Not run: 
##D f <- polyApprox(sin, -pi, pi, 9)$f
##D x <- seq(-pi, pi, length.out = 100)
##D y <- sin(x) - f(x)
##D plot(x, y, type = "l", col = "blue")
##D grid()
## End(Not run)



