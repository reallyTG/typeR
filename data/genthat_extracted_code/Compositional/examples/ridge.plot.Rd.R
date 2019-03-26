library(Compositional)


### Name: Ridge regression plot
### Title: Ridge regression plot
### Aliases: ridge.plot
### Keywords: ridge regression plot

### ** Examples

y <- as.vector(iris[, 1])
x <- as.matrix(iris[, 2:4])
ridge.plot(y, x, lambda = seq(0, 2, by = 0.1) )



