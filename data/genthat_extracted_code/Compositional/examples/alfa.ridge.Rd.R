library(Compositional)


### Name: Ridge regression with compositional data in the covariates side using the alpha-transformation
### Title: Ridge regression with compositional data in the covariates side
###   using the alpha-transformation
### Aliases: alfa.ridge
### Keywords: \alpha -transformation ridge regression

### ** Examples

library(MASS)
y <- as.vector(fgl[, 1])
x <- as.matrix(fgl[, 2:9])
x <- x/ rowSums(x)
mod1 <- alfa.ridge(y, x, a = 0.5, lambda = 0.1, B = 1, xnew = NULL)
mod2 <- alfa.ridge(y, x, a = 0.5, lambda = 1, B = 1, xnew = NULL)



