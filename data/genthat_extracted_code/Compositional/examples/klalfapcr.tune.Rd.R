library(Compositional)


### Name: Tuning of the divergence based regression for compositional data with compositional data in the covariates side using the alpha-transformation
### Title: Tuning of the divergence based regression for compositional data
###   with compositional data in the covariates side using the
###   alpha-transformation
### Aliases: klalfapcr.tune

### ** Examples

library(MASS)
y <- rdiri(214, runif(4, 1, 3))
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
mod <- klalfapcr.tune(y = y, x = x, a = c(0.7, 0.8, 0.9, 1) )
mod



