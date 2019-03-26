library(Compositional)


### Name: Tuning the principal components with GLMs
### Title: Tuning the principal components with GLMs
### Aliases: glmpcr.tune multinompcr.tune
### Keywords: GLM principal components

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:9])
y <- rpois(214, 10)
glmpcr.tune(y, x, M=10, maxk = 20, mat = NULL, ncores = 1)



