library(lazy)


### Name: predict.lazy
### Title: Predict method for lazy learning
### Aliases: predict.lazy
### Keywords: regression

### ** Examples

library("lazy")
data(cars)
cars.lazy <- lazy(dist ~ speed, cars)
predict(cars.lazy, data.frame(speed = seq(5, 30, 1)))



