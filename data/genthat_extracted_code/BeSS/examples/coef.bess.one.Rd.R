library(BeSS)


### Name: coef.bess.one
### Title: Provides estimated coefficients from a fitted "bess.one" object.
### Aliases: coef.bess.one

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess.one(data$x, data$y, s = 10, family = "gaussian")
coef(fit, sparse=TRUE)  # The estimated coefficients



