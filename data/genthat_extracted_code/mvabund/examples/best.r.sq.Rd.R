library(mvabund)


### Name: best.r.sq
### Title: Use R^2 to find the variables that best explain a multivariate
###   response.
### Aliases: best.r.sq
### Keywords: htest models regression multivariate

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

best.r.sq( spiddat~X )



