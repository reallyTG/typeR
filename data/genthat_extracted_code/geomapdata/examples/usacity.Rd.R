library(geomapdata)


### Name: usacity
### Title: City Locations and Populations(USA)
### Aliases: usacity worldcity
### Keywords: datasets

### ** Examples

## Not run: 
##D library(GEOmap)
##D data(USAmap)
##D 
##D data(usacity)
##D s=list()
##D s$x=c(230.515290931,295.314341808)
##D s$y=c(27.1303332212,49.7820066148)
##D 
##D plotGEOmap(USAmap)
##D 
##D rect(s$x[1], s$y[1], s$x[2], s$y[2]) 
##D 
##D plotGEOmap(USAmap, LIM=c(s$x[1], s$y[1], s$x[2], s$y[2]) )
##D 
##D points(usacity$lon[usacity$p>10000],usacity$lat[usacity$p>10000], col='red')
##D 
##D 
##D  
##D 
## End(Not run)



