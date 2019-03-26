library(growthmodels)


### Name: generalisedLogistic
### Title: Generalised Logistic growth model
### Aliases: generalisedLogistic generalisedLogistic.inverse

### ** Examples

growth <- generalisedLogistic(0:10, 5, 10, 0.3, 0.5, 3)
# Calculate inverse function
time <- generalisedLogistic.inverse(growth, 5, 10, 0.3, 0.5, 3)



