library(TDA)


### Name: knnDE
### Title: k Nearest Neighbors Density Estimator over a Grid of Points
### Aliases: knnDE
### Keywords: nonparametric

### ** Examples

## Generate Data from the unit circle
n <- 300
X <- circleUnif(n)

## Construct a grid of points over which we evaluate the function
by <- 0.065
Xseq <- seq(-1.6, 1.6, by = by)
Yseq <- seq(-1.7, 1.7, by = by)
Grid <- expand.grid(Xseq, Yseq)

## kernel density estimator
k <- 50
KNN <- knnDE(X, Grid, k)



