library(BeSS)


### Name: summary.bess.one
### Title: summary method for a "bess.one" object
### Aliases: summary.bess.one

### ** Examples

data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess.one(data$x, data$y, s = 10, family = "gaussian")
summary(fit)




