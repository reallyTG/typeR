library(BeSS)


### Name: deviance.bess.one
### Title: Extract the deviance from a "bess.one" object.
### Aliases: deviance.bess.one

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess.one(data$x, data$y, s = 10, family = "gaussian")
deviance(fit)




