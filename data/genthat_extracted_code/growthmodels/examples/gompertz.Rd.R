library(growthmodels)


### Name: gompertz
### Title: Gompertz growth model
### Aliases: gompertz gompertz.inverse

### ** Examples

growth <- gompertz(0:10, 10, 0.5, 0.3)
# Calculate inverse function
time <- gompertz.inverse(growth, 10, 0.5, 0.3)



