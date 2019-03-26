library(pracma)


### Name: quadv
### Title: Vectorized Integration
### Aliases: quadv
### Keywords: math

### ** Examples

##  Examples
f1 <- function(x) c(sin(x), cos(x))
quadv(f1, 0, pi)
# $Q
#  [1] 2.000000e+00 1.110223e-16
# $fcnt
#  [1] 65
# $estim.prec
#  [1] 4.321337e-07

f2 <- function(x) x^c(1:10)
quadv(f2, 0, 1, tol = 1e-12)
# $Q
#  [1] 0.50000000 0.33333333 0.25000000 0.20000000 0.16666667
#  [6] 0.14285714 0.12500000 0.11111111 0.10000000 0.09090909
# $fcnt
#  [1] 505
# $estim.prec
#  [1] 2.49e-10



