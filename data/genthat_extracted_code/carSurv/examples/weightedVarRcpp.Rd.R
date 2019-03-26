library(carSurv)


### Name: weightedVarRcpp
### Title: Estimate weighted variance
### Aliases: weightedVarRcpp
### Keywords: survival

### ** Examples

# Simulate a random vector
set.seed(3975)
x <- rnorm(100)
# Calculate variance with standard implementation
# Rescaling ensures that both calculations use same denominator "n"
varEst <- var(x) * (100-1) / 100
# Calculate weighted variance with equal weights
equalW <- rep(1/100, 100)
weightVarEst <- weightedVarRcpp(y=x, w=equalW)
# Output comparison
all.equal(varEst, weightVarEst)
# Runtime comparison
library(microbenchmark)
microbenchmark(Default=var(x), New=weightedVarRcppN(y=x, w=equalW), times=25)
# -> New method is multiple times faster



