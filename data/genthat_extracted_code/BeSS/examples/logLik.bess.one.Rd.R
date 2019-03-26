library(BeSS)


### Name: logLik.bess.one
### Title: Extract the loglikelihood from a "bess.one" object.
### Aliases: logLik.bess.one

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess.one(data$x, data$y, s = 10, family = "gaussian")
logLik(fit)




