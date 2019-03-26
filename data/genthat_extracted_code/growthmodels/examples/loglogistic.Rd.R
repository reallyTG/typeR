library(growthmodels)


### Name: loglogistic
### Title: Log-logistic growth model
### Aliases: loglogistic loglogistic.inverse

### ** Examples

growth <- loglogistic(0:10, 10, 0.5, 0.3)
# Calculate inverse function
time <- loglogistic.inverse(growth, 10, 0.5, 0.3)



