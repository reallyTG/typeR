library(gensvm)


### Name: coef.gensvm
### Title: Get the coefficients of the fitted GenSVM model
### Aliases: coef.gensvm

### ** Examples

x <- iris[, -5]
y <- iris[, 5]

fit <- gensvm(x, y)
V <- coef(fit)




