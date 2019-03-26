library(Compositional)


### Name: Ridge regression with the alpha-transformation plot
### Title: Ridge regression plot
### Aliases: alfaridge.plot
### Keywords: ridge regression plot

### ** Examples

library(MASS)
y <- as.vector(fgl[, 1])
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
alfaridge.plot(y, x, a = 0.5, lambda = seq(0, 5, by = 0.1) )



