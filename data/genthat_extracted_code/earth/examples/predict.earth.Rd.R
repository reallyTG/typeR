library(earth)


### Name: predict.earth
### Title: Predict with an earth model
### Aliases: predict.earth
### Keywords: models

### ** Examples

data(trees)
earth.mod <- earth(Volume ~ ., data = trees)
predict(earth.mod)           # same as earth.mod$fitted.values
predict(earth.mod, c(10,80)) # yields 16.8



