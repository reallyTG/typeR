library(multisensi)


### Name: basis.osplines
### Title: A function to decompose multivariate data on an orthogonal
###   B-spline basis (O-spline)
### Aliases: basis.osplines
### Keywords: orthogonalized B-spline dimension reduction

### ** Examples

data(biomasseY)

res <- basis.osplines(biomasseY,basis.args=list(knots=7,mdegree=3))




