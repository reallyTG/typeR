library(rts)


### Name: subset
### Title: Subset layers in a raster time series object
### Aliases: subset subset,RasterStackBrickTS-method
### Keywords: utilities

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D ndvi <- rts(file) # read the ndvi time series from the specified file
##D 
##D s1 <- subset(ndvi,1:5) # subset the first 5 raster layers into a new raster time series object
##D 
##D s1
##D 
##D plot(s1)
##D 
##D s2 <- subset(ndvi,"/2000") # subset all layers till end of year 2000
##D 
##D s2
##D 
##D plot(s2)
##D 
##D s3 <- subset(ndvi,"2000-01-01/2000-05-31")
##D 
##D s3
##D 
##D plot(s3)
##D 
## End(Not run)




