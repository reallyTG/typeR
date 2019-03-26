library(multisensi)


### Name: basis.bsplines
### Title: A function to decompose multivariate data on a B-spline basis
### Aliases: basis.bsplines
### Keywords: B-spline dimension reduction

### ** Examples

data(biomasseY)

res <- basis.bsplines(biomasseY,basis.args=list(knots=7,mdegree=3))




