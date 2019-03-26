library(neariso)


### Name: neariso
### Title: Near-Isotonic Regression
### Aliases: neariso Neariso nearisoGetSolution nearisoGetBreakpoints
### Keywords: regression multivariate

### ** Examples

library(neariso)
# generate some artificial data
y <- rnorm(1000) + (1:1000)/3000

### run the algorithm as default; will output solution at 100 breakpoints for lambda
res0 <- neariso(y)

### apply function nir and get solution directly
lambda = 0:10/10
res <- neariso(y, lambda=lambda)

### apply the function and get the solution later
res2 <- neariso(y, lambda=NULL)
res2 <- nearisoGetSolution(res2, lambda=lambda)

### look at the breakpoints
lambdaBreaks <- nearisoGetBreakpoints(res2, maxBreaks=1000)
res3 <- nearisoGetSolution(res2, lambda=lambdaBreaks)



