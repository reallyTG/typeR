library(EcoGenetics)


### Name: eco.NDVI
### Title: Generation of atmospherically corrected NDVI and MSAVI2 images
###   for temporal series of Landsat 5 and 7
### Aliases: eco.NDVI

### ** Examples

## Not run: 
##D require(raster)
##D 
##D data(tab)
##D 
##D temp <-list()
##D 
##D # we create 4 simulated rasters for the data included in the object tab:
##D 
##D for(i in 1:4) {
##D temp[[i]] <- runif(19800, 0, 254)
##D temp[[i]] <- matrix(temp[[i]], 180, 110)
##D temp[[i]] <- raster(temp[[i]], crs="+proj=utm")
##D extent(temp[[i]])<-c(3770000, 3950000, 6810000, 6920000)
##D }
##D 
##D writeRaster(temp[[1]], "20040719b4.tif", overwrite=T)
##D writeRaster(temp[[2]], "20040719b3.tif", overwrite=T)
##D writeRaster(temp[[3]], "20091106b4.tif", overwrite=T)
##D writeRaster(temp[[4]], "20091106b3.tif", overwrite=T)
##D 
##D # Computing NDVI images: 
##D 
##D eco.NDVI(tab, "COST", "NDVI", "LT5")
##D 
##D example <- raster("NDVICOST20040719.tif")
##D image(example)
##D 
##D file.remove(c("NDVICOST20040719.tif", "NDVICOST20091106.tif",
##D "20040719b4.tif", "20040719b3.tif", "20091106b4.tif", 
##D "20091106b3.tif")
## End(Not run)




