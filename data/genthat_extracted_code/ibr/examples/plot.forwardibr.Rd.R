library(ibr)


### Name: plot.forwardibr
### Title: Plot diagnostic for an ibr object
### Aliases: plot.forwardibr
### Keywords: smooth multivariate

### ** Examples

## Not run: 
##D data(ozone, package = "ibr")
##D ibrsel <- forward(ibr(ozone[,-1],ozone[,1],df=1.2)
##D plot(ibrsel)
##D plot(apply(ibrsel,1,min,na.rm=TRUE),type="l")
## End(Not run)



