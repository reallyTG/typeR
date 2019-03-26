library(BeSS)


### Name: print.bess.one
### Title: print method for a "bess.one" object
### Aliases: print.bess.one

### ** Examples

data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess.one(data$x, data$y, s = 10, family = "gaussian")
print(fit)




