library(Compositional)


### Name: Divergence based regression for compositional data with compositional data in the covariates side using the alpha-transformation
### Title: Divergence based regression for compositional data with
###   compositional data in the covariates side using the
###   alpha-transformation
### Aliases: kl.alfapcr

### ** Examples

library(MASS)
y <- rdiri(214, runif(4, 1, 3))
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
mod <- alfa.pcr(y = y, x = x, 0.7, 1)
mod



