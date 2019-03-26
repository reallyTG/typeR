library(fda.usc)


### Name: Outliers.fdata
### Title: Detecting outliers for functional dataset
### Aliases: Outliers.fdata outliers.depth.pond outliers.depth.trim
###   outliers.thres.lrt outliers.lrt quantile.outliers.trim
###   quantile.outliers.pond
### Keywords: outliers

### ** Examples

## Not run: 
##D data(aemet)
##D nb=20 # Time consuming
##D out.trim<-outliers.depth.trim(aemet$temp,dfunc=depth.FM,nb=nb)
##D plot(aemet$temp,col=1,lty=1)
##D lines(aemet$temp[out.trim[[1]]],col=2)
## End(Not run)



