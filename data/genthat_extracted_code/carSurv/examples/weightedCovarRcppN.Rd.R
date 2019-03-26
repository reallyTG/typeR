library(carSurv)


### Name: weightedCovarRcppN
### Title: Estimate weighted covariance
### Aliases: weightedCovarRcppN
### Keywords: survival

### ** Examples

# Simulate two random vectors
set.seed(3975)
x <- rnorm(100)
set.seed(-3975)
y <- rnorm(100)
# Calculate variance with standard R function
# Rescaling ensures that both calculations use same denominator "n"
covarEst <- cov(x, y) * (100-1) / 100
# Calculate weighted variance with equal weights
equalW <- rep(1, 100)
weightCovarEst <- weightedCovarRcppN(x=x, y=y, w=equalW)
# Output comparison
all.equal(covarEst, weightCovarEst)
# Runtime comparison
library(microbenchmark)
microbenchmark(Default=cov(x, y), New=weightedCovarRcpp(x=x, y=y, w=equalW), times=25)
# -> New method is multiple times faster



