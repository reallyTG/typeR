library(mapmisc)


### Name: gridlinesWrap
### Title: Adds long-lat grid for projected data
### Aliases: gridlinesWrap

### ** Examples

## Not run: 
##D Npoints = 20
##D myPoints = SpatialPointsDataFrame(
##D 	cbind(
##D 	runif(Npoints, -15000000, 15000000), 
##D 	runif(Npoints, -8000000, 8000000)), 
##D 	data=data.frame(y1=c(NA, rnorm(Npoints-1)), 
##D 	y2=c(sample(0:5, Npoints-1,replace=TRUE), NA)),
##D 	proj4string=moll(c(-100,0))
##D )
##D 
##D 
##D plot(myPoints)
##D gridlinesWrap(myPoints, lty=3, col='red')
## End(Not run)




