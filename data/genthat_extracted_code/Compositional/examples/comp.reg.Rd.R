library(Compositional)


### Name: Multivariate regression with compositional data
### Title: Multivariate regression with compositional data
### Aliases: comp.reg
### Keywords: multivariate rgression spatial median regression

### ** Examples

library(MASS)
y <- as.matrix(iris[, 1:3])
y <- y / rowSums(y)
x <- as.vector(iris[, 4])
mod1 <- comp.reg(y, x)
mod2 <- comp.reg(y, x, type = "spatial")



