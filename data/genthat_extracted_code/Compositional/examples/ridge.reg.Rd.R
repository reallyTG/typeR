library(Compositional)


### Name: Ridge regression
### Title: Ridge regression
### Aliases: ridge.reg
### Keywords: ridge regression regularisation

### ** Examples

y <- as.vector(iris[, 1])
x <- as.matrix(iris[, 2:4])
mod1 <- ridge.reg(y, x, lambda = 0.1)
mod2 <- ridge.reg(y, x, lambda = 0)



