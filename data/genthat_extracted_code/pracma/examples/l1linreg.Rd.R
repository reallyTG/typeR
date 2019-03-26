library(pracma)


### Name: L1linreg
### Title: L1 Linear Regression
### Aliases: L1linreg
### Keywords: optimize

### ** Examples

m <- 101; n <- 10       # no. of data points, degree of polynomial
x <- seq(-1, 1, len=m)
y <- runge(x)           # Runge's function
A <- outer(x, n:0, '^') # Vandermonde matrix
b <- y

( sol <- L1linreg(A, b) )
# $x
# [1] -21.93242   0.00000  62.91092   0.00000 -67.84854   0.00000
# [7]  34.14400   0.00000  -8.11899   0.00000   0.84533
# 
# $reltol
# [1] 6.712355e-10
# 
# $niter
# [1] 81

# minimum value of polynomial L1 regression
sum(abs(polyval(sol$x, x) - y))
# [1] 3.061811



