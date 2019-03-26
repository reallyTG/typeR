library(BeSS)


### Name: aic
### Title: Extract the IC from a "bess" object.
### Aliases: aic bic ebic

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
aic(fit)
bic(fit)
ebic(fit)




