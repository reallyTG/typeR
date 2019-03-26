library(rts)


### Name: Extract by index
### Title: Exrtract values from raster time series
### Aliases: [,RasterStackBrickTS,Spatial,ANY-method
###   [,RasterStackBrickTS,numeric,ANY-method
###   [,RasterStackBrickTS,Extent,ANY-method
### Keywords: utilities

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D ndvi <- rts(file) # read the ndvi time series from the specified file
##D 
##D n1 <- ndvi[125] # extract the time series values at cell number 125 for all available times
##D 
##D n1
##D 
##D plot(n1)
##D 
##D n2 <- ndvi[125,"/20090101"] # extract the time series values at cell number 125 for 
##D # all times after 2009-01-01
##D 
##D n2
##D 
##D plot(n2)
##D 
##D n3 <- ndvi[125,"200901/"] # extract the time series values at cell number 125 for all
##D # times before 2009-01
##D 
##D n4 <- ndvi[10:20,"2008-05-01"] #extract the values at cell numbers of 10:20 for 
##D # the specified time
##D 
##D n4
##D 
##D 
## End(Not run)




