library(flsa)


### Name: flsa
### Title: Fused Lasso Signal Approximator
### Aliases: flsa FLSA flsaGetSolution flsaTopDown
### Keywords: regression multivariate

### ** Examples

library(flsa)
# generate some artificial data, 1 and 2 dimensional
y <- rnorm(100)
y2Dim = matrix(rnorm(100), ncol=10)

### apply function flsa and get solution directly
lambda2= 0:10/10
res <- flsa(y, lambda2=lambda2)
res2Dim <- flsa(y2Dim, lambda2=lambda2)

### apply the function and get the solution later
resSolObj <- flsa(y, lambda2=NULL)
resSolObjTopDown <- flsaTopDown(y)
resSolObj2Dim <- flsa(y2Dim, lambda2=NULL)

res2 <- flsaGetSolution(resSolObj, lambda2=lambda2)
### here note that the solution object does not store that the input was 2 dimensional
### therefore, res2Dim does not give out the solution as a 2 dimensional matrix (unlike the direct version above)
res2Dim2 <- flsaGetSolution(resSolObj2Dim, lambda2=lambda2)




