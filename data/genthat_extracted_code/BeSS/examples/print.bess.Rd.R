library(BeSS)


### Name: print.bess
### Title: print method for a "bess" object
### Aliases: print.bess

### ** Examples

data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
print(fit)




