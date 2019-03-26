library(rstpm2)


### Name: predict.nsx
### Title: Evaluate a Spline Basis
### Aliases: predict.nsx
### Keywords: smooth

### ** Examples

basis <- nsx(women$height, df = 5)
newX <- seq(58, 72, length.out = 51)
# evaluate the basis at the new data
predict(basis, newX)



