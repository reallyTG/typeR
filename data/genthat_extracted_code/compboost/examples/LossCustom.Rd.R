library(compboost)


### Name: LossCustom
### Title: Create LossCustom by using R functions.
### Aliases: LossCustom

### ** Examples


# Loss function:
myLoss = function (true.values, prediction) {
  return (0.5 * (true.values - prediction)^2)
}
# Gradient of loss function:
myGradient = function (true.values, prediction) {
  return (prediction - true.values)
}
# Constant initialization:
myConstInit = function (true.values) {
  return (mean(true.values))
}

# Create new custom quadratic loss:
my.loss = LossCustom$new(myLoss, myGradient, myConstInit)




