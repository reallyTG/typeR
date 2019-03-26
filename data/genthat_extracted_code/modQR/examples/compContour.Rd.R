library(modQR)


### Name: compContourM1/2u
### Title: Directional Regression Quantile Computation
### Aliases: compContourM1u compContourM2u compContourM1/2u

### ** Examples

##computing all directional 0.15-quantiles of 199 random points
##uniformly distributed in the unit square centered at zero
##- preparing the input
Tau  <- 0.15
XMat <- matrix(1, 199, 1)
YMat <- matrix(runif(2*199, -0.5, 0.5), 199, 2)
##- Method 1:
COutST <- compContourM1u(Tau, YMat, XMat)
##- Method 2:
COutST <- compContourM2u(Tau, YMat, XMat)



