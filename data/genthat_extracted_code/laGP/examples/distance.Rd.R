library(laGP)


### Name: distance
### Title: Calculate the squared Euclidean distance between pairs of points
### Aliases: distance
### Keywords: utilities

### ** Examples

x <- seq(-2, 2, length=11)
X <- as.matrix(expand.grid(x, x))
## predictive grid with NN=400
xx <- seq(-1.9, 1.9, length=20)
XX <- as.matrix(expand.grid(xx, xx))

D <- distance(X)
DD <- distance(X, XX)



