library(Compositional)


### Name: Helper functions for the Kullback-Leibler regression
### Title: Helper functions for the Kullback-Leibler regression
### Aliases: kl.compreg2 klcompreg.boot
### Keywords: Kullback-Lebler divergence multivariate regression

### ** Examples

  library(MASS)
  x <- as.vector(fgl[, 1])
  y <- as.matrix(fgl[, 2:9])
  y <- y / rowSums(y)
  mod1<- kl.compreg(y, x, B = 1, ncores = 1)
  mod2 <- js.compreg(y, x, B = 1, ncores = 1)



