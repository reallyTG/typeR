library(Compositional)


### Name: Multivariate or univariate regression with compositional data in the covariates side using the alpha-transformation
### Title: Multivariate or univariate regression with compositional data in
###   the covariates side using the alpha-transformation
### Aliases: alfa.pcr
### Keywords: \alpha -transformation principal components regression

### ** Examples

library(MASS)
y <- as.vector(fgl[, 1])
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
mod <- alfa.pcr(y = y, x = x, 0.7, 1)
mod



