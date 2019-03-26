library(bayesSurv)


### Name: vecr2matr
### Title: Transform single component indeces to double component indeces
### Aliases: vecr2matr
### Keywords: connection

### ** Examples

### Bivariate G-spline
### with 31 knots in each dimension
KK <- c(15, 15)

### First observation in component (-15, -15),
### second observation in component (15, 15),
### third observation in component (0, 0)
vec.r <- c(1, 961, 481)
vecr2matr(vec.r, KK)



