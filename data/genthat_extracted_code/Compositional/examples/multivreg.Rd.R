library(Compositional)


### Name: Multivariate linear regression
### Title: Multivariate linear regression
### Aliases: multivreg
### Keywords: multivariate linear regression

### ** Examples

library(MASS)
x <- as.matrix(iris[, 1:2])
y <- as.matrix(iris[, 3:4])
multivreg(y, x, plot = TRUE)



