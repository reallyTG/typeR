library(BeSS)


### Name: coef.bess
### Title: Provides estimated coefficients from a fitted "bess" object.
### Aliases: coef.bess

### ** Examples


data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
coef(fit, sparse=TRUE)  # The estimated coefficients



