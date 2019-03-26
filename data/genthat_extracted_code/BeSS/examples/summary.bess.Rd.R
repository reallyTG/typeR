library(BeSS)


### Name: summary.bess
### Title: summary method for a "bess" object
### Aliases: summary.bess

### ** Examples

data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
summary(fit)




