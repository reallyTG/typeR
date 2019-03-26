library(growthmodels)


### Name: stannard
### Title: Stannard growth model
### Aliases: stannard stannard.inverse

### ** Examples

growth <- stannard(0:10, 1, .2, .1, .5)
# Calculate inverse function
time <- stannard.inverse(growth, 1, .2, .1, .5)



