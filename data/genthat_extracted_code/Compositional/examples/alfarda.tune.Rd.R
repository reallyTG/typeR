library(Compositional)


### Name: Cross validation for the regularised discriminant analysis with compositional data using the alpha-transformation
### Title: Cross validation for the regularised discriminant analysis with
###   compositional data using the alpha-transformation
### Aliases: alfarda.tune
### Keywords: Regularised discriminant analysis cross-validation

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
ina <- fgl[, 10]
moda <- alfarda.tune(x, ina, a = seq(0.7, 1, by = 0.1), M = 10,
gam = seq(0.1, 0.3, by = 0.1), del = seq(0.1, 0.3, by = 0.1),
ncores = 1, mat = NULL)



