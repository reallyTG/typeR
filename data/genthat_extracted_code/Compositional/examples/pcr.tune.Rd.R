library(Compositional)


### Name: Tuning of the principal components regression
### Title: Tuning of the principal components regression
### Aliases: pcr.tune
### Keywords: principal components linear regression

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:9])
y <- as.vector(fgl[, 1])
pcr.tune(y, x, M = 10, maxk = 50, mat = NULL, ncores = 1)



