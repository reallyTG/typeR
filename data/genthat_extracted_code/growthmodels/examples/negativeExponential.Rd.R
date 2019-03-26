library(growthmodels)


### Name: negativeExponential
### Title: Negative exponential growth model
### Aliases: negativeExponential negativeExponential.inverse

### ** Examples

growth <- negativeExponential(0:10, 1, 0.3)
# Calculate inverse function
time <- negativeExponential.inverse(growth, 10, 0.3)



