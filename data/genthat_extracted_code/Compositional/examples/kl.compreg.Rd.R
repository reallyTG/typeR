library(Compositional)


### Name: Divergence based regression for compositional data
### Title: Divergence based regression for compositional data
### Aliases: kl.compreg js.compreg
### Keywords: Kullback-Lebler divergence multivariate regression

### ** Examples

library(MASS)
x <- as.vector(fgl[, 1])
y <- as.matrix(fgl[, 2:9])
y <- y / rowSums(y)
mod1<- kl.compreg(y, x, B = 1, ncores = 1)
mod2 <- js.compreg(y, x, B = 1, ncores = 1)



