library(shotGroups)


### Name: getRayParam
### Title: Estimate Rayleigh parameters sigma, mean and standard deviation
### Aliases: getRayParam getRayParam.data.frame getRayParam.default

### ** Examples

# coordinates given by a suitable data frame
getRayParam(DFtalon, level=0.95, doRob=FALSE)

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(100, 0, 5), 2), ncol=2)
##D getRayParam(xy, level=0.95, doRob=FALSE)
## End(Not run)



