library(gsrsb)


### Name: cdBoundary
### Title: Lower and Upper Bounds Generator
### Aliases: cdBoundary

### ** Examples

cvec <- rep(1.992,3)
dvec <- c(1.535*sqrt(3),1.535*sqrt(3/2),1.535)
gammaVec <- c(sqrt(1/3),sqrt(2/3),1)
dlt <- 2
uBoundary <- cdBoundary(cvec, dvec, gammaVec, dlt, upper=TRUE)




