library(cellWise)


### Name: wrap
### Title: Wrap the data.
### Aliases: wrap

### ** Examples

library(MASS) 
set.seed(12345) 
n <- 100; d <- 10
X <- mvrnorm(n, rep(0, 10), diag(10))
locScale <- estLocScale(X)
Xw <- wrap(X, locScale$loc, locScale$scale)$Xw



