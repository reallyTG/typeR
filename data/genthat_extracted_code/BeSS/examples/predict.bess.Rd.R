library(BeSS)


### Name: predict.bess
### Title: make predictions from a "bess" object.
### Aliases: predict.bess

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
pred=predict(fit, newdata = data$x)




