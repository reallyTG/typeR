library(growthmodels)


### Name: mitcherlich
### Title: Mitcherlich growth model
### Aliases: mitcherlich mitcherlich.inverse

### ** Examples

growth <- mitcherlich(0:10, 10, 0.5, 0.3)
# Calculate inverse function
time <- mitcherlich.inverse(growth, 10, 0.5, 0.3)



