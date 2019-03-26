library(lazy)


### Name: lazy
### Title: Lazy learning for local regression
### Aliases: lazy print.lazy print.summary.lazy summary.lazy
### Keywords: regression

### ** Examples

library("lazy")
data(cars)
cars.lazy <- lazy(dist ~ speed, cars)
predict(cars.lazy, data.frame(speed = seq(5, 30, 1)))



