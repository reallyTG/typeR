library(growthmodels)


### Name: logistic
### Title: Logistic growth model
### Aliases: logistic logistic.inverse

### ** Examples

growth <- logistic(0:10, 10, 0.5, 0.3)
# Calculate inverse function
time <- logistic.inverse(growth, 10, 0.5, 0.3)



