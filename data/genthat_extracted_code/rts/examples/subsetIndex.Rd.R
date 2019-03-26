library(rts)


### Name: subset by index
### Title: Subset layers in a raster time series object by index
### Aliases: [[,RasterStackBrickTS,ANY,ANY-method
### Keywords: utilities

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D ndvi <- rts(file) # read the ndvi time series from the specified file
##D 
##D s1 <- ndvi[["2000-01-01/2000-05-31"]]
##D 
##D s1
##D 
##D plot(s1)
##D 
## End(Not run)




