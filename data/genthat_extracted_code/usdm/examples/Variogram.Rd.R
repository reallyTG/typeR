library(usdm)


### Name: Variogram
### Title: Empirical variogram for raster data
### Aliases: Variogram Variogram,RasterLayer-method
### Keywords: spatial

### ** Examples

## Not run: 
##D file <- system.file("external/spain.grd", package="usdm")
##D 
##D r <- brick(file) # reading a RasterBrick object including 10 raster layers in Spain
##D 
##D r 
##D 
##D plot(r[[1]]) # plot the first RasterLayer in r
##D 
##D v1 <- Variogram(r[[1]]) # compute the sample variogram for the first layer in r
##D 
##D v2 <- Variogram(r[[1]],lag=25000,cutoff=100000) # specify the lag and cutoff parameters
## End(Not run)




