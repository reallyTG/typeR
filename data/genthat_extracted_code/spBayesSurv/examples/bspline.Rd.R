library(spBayesSurv)


### Name: bspline
### Title: Generate a Cubic B-Spline Basis Matrix
### Aliases: bspline makepredictcall.bspline

### ** Examples

require(stats)
basis <- bspline(women$height, df = 5)
newX <- seq(58, 72, length.out = 51)
# evaluate the basis at the new data
predict(basis, newX)



