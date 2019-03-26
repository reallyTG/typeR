library(Directional)


### Name: Tuning of the k-NN regression
### Title: Tuning of the k-NN regression with Euclidean or
###   (hyper-)spherical response and or predictor variables
### Aliases: knnreg.tune
### Keywords: k-NN regression Cross-validation Euclidean data Spherical
###   data

### ** Examples

y <- iris[, 1]
x <- iris[, 2:4]
x <- x/ sqrt( rowSums(x^2) )  ## Euclidean response and spherical predictors
knnreg.tune(y, x, A = 5, res = "eucl", type = "spher", estim = "arithmetic",
mat = NULL, graph = TRUE)

y <- iris[, 1:3]
y <- y/ sqrt( rowSums(y^2) )  ## Spherical response and Euclidean predictor
x <- iris[, 2]
knnreg.tune(y, x, A = 5, res = "spher", type = "euclidean", estim = "arithmetic",
mat = NULL, graph = TRUE)



