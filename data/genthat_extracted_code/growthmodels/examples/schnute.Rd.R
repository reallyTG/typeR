library(growthmodels)


### Name: schnute
### Title: Schnute growth model
### Aliases: schnute schnute.inverse

### ** Examples

growth <- schnute(0:10, 10, 5, .5, .5)
# Calculate inverse function
time <- schnute.inverse(growth, 10, 5, .5, .5)



