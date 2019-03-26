library(Directional)


### Name: k-NN regression
### Title: k-NN regression with Euclidean or (hyper-)spherical response and
###   or predictor variables
### Aliases: knn.reg
### Keywords: k-NN regression Euclidean data Spherical data

### ** Examples

y <- iris[, 1]
x <- as.matrix(iris[, 2:4])
x <- x/ sqrt( rowSums(x^2) )  ## Euclidean response and spherical predictors
a <- knn.reg(x, y, x, k = 5, res = "eucl", type = "spher", estim = "arithmetic")

y <- iris[, 2:4]
y <- y / sqrt( rowSums(y^2) )  ## Spherical response and Euclidean predictor
x <- iris[, 1]
a <- knn.reg(x, y, x, k = 5, res = "spher", type = "euclidean", estim = "arithmetic")



