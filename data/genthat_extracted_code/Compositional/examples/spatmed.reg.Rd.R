library(Compositional)


### Name: Spatial median regression
### Title: Spatial median regression
### Aliases: spatmed.reg
### Keywords: spatial median regression multivariate regression

### ** Examples

library(MASS)
x <- as.matrix(iris[, 3:4])
y <- as.matrix(iris[, 1:2])
mod1 <- spatmed.reg(y, x)
mod2 <- multivreg(y, x, plot = FALSE)



