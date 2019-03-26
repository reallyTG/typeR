library(BeSS)


### Name: logLik.bess
### Title: Extract the loglikelihood from a "bess" object.
### Aliases: logLik.bess

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
logLik(fit)




