library(Compositional)


### Name: Tuning the parameters of the regularised discriminant analysis
### Title: Tuning the parameters of the regularised discriminant analysis
### Aliases: rda.tune
### Keywords: Regularised discriminant analysis Tuning of the
###   hyper-parameters

### ** Examples

mod <- rda.tune(as.matrix(iris[, 1:4]), iris[, 5], M = 10, gam = seq(0, 1, by = 0.2),
del = seq(0, 1, by = 0.2), ncores = 1, mat = NULL)
mod



