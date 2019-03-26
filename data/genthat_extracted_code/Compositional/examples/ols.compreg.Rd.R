library(Compositional)


### Name: Non linear least squares regression for compositional data
### Title: Non linear least squares regression for compositional data
### Aliases: ols.compreg
### Keywords: ordinary least squares multivariate regression

### ** Examples

library(MASS)
x <- as.vector(fgl[, 1])
y <- as.matrix(fgl[, 2:9])
y <- y / rowSums(y)
mod1 <- ols.compreg(y, x, B = 1, ncores = 1)
mod2 <- js.compreg(y, x, B = 1, ncores = 1)



