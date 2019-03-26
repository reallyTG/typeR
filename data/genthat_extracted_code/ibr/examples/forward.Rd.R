library(ibr)


### Name: forward
### Title: Iterative bias reduction smoothing
### Aliases: forward forwardibr
### Keywords: smooth multivariate

### ** Examples

## Not run: 
##D data(ozone, package = "ibr")
##D res.ibr <- forward(ozone[,-1],ozone[,1],df=1.2)
##D apply(res.ibr,1,which.min)
## End(Not run)



