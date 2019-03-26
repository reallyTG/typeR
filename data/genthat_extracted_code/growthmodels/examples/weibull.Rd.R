library(growthmodels)


### Name: weibull
### Title: Weibull growth model
### Aliases: weibull weibull.inverse

### ** Examples

growth <- weibull(0:10, 10, 0.5, 0.3, 0.5)
# Calculate inverse function
time <- weibull.inverse(growth, 10, 0.5, 0.3, 0.5)



