library(rts)


### Name: extract
### Title: Extract values from raster time series
### Aliases: extract extract,RasterStackBrickTS,Spatial-method
###   extract,RasterStackBrickTS,Extent-method
###   extract,RasterStackBrickTS,numeric-method
### Keywords: utilities

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D ndvi <- rts(file) # read the ndvi time series from the specified file
##D 
##D n1 <- extract(ndvi,125)# extract the time series values at cell number 125 for all times
##D 
##D n1
##D 
##D plot(n1)
##D 
##D n2 <- extract(ndvi,125,"/20090101") # extract the time series values at cell number 125
##D # for all times after 2009-01-01
##D 
##D n2
##D plot(n2)
##D 
##D n3 <- extract(ndvi,125,"200901/") # extract the time series values at cell number 125 for 
##D # all times before 2009-01
##D 
##D n4 <- extract(ndvi,10:20,"2008") # extract the values at cell numbers of 10:20 in 
##D # the year of 2008
##D 
##D n4
## End(Not run)






