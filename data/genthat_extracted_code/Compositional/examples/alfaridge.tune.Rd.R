library(Compositional)


### Name: Cross validation for the ridge regression with compositional data as predictor using the alpha-transformation
### Title: Cross validation for the ridge regression with compositional
###   data as predictor using the alpha-transformation
### Aliases: alfaridge.tune
### Keywords: \alpha -transformation ridge regression parameters tuning

### ** Examples

library(MASS)
y <- as.vector(fgl[, 1])
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
alfaridge.tune( y, x, M = 10, a = seq(0.1, 1, by = 0.1),
lambda = seq(0, 1, by = 0.1) )



