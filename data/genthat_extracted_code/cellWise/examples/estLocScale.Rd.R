library(cellWise)


### Name: estLocScale
### Title: Estimate robust location and scale
### Aliases: estLocScale

### ** Examples

library(MASS) 
set.seed(12345) 
n = 100; d = 10
X = mvrnorm(n, rep(0, 10), diag(10))
locScale = estLocScale(X)



