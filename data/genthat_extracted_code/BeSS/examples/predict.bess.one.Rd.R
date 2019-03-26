library(BeSS)


### Name: predict.bess.one
### Title: make predictions from a "bess.one" object.
### Aliases: predict.bess.one

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess.one(data$x, data$y, s = 10, family = "gaussian")
pred <- predict(fit, newdata = data$x)




