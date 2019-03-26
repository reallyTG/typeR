library(Compositional)


### Name: Cross validation for the ridge regression
### Title: Cross validation for the ridge regression
### Aliases: ridge.tune
### Keywords: Ridge regression

### ** Examples

y <- as.vector(iris[, 1])
x <- as.matrix(iris[, 2:4])
ridge.tune( y, x, M = 10, lambda = seq(0, 2, by = 0.1), graph = TRUE )



