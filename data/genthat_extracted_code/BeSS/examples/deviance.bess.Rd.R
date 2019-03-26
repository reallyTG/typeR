library(BeSS)


### Name: deviance.bess
### Title: Extract the deviance from a "bess" object.
### Aliases: deviance.bess

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
deviance(fit)




