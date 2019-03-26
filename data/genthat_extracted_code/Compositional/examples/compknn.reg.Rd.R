library(Compositional)


### Name: k-NN regression with compositional data
### Title: k-NN regression with compositional data
### Aliases: compknn.reg

### ** Examples

library(MASS)
y <- as.matrix(iris[, 1:3])
y <- y / rowSums(y)
x <- as.vector(iris[, 4])
mod <- compknn.reg(y, x, xnew = x, k = c(2:4))



