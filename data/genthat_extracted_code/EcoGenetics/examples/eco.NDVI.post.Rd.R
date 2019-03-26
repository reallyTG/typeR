library(EcoGenetics)


### Name: eco.NDVI.post
### Title: Postprocessing for NDVI and MSAVI2 temporal series of Landsat 5
###   and 7
### Aliases: eco.NDVI.post

### ** Examples

## Not run: 
##D require(raster)
##D 
##D data(tab)
##D data(eco3)
##D temp <- list()
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
##D writeRaster(temp[[1]], "20040719b4.tif", overwrite = T) 
##D writeRaster(temp[[2]], "20040719b3.tif", overwrite = T)
##D writeRaster(temp[[3]], "20091106b4.tif", overwrite = T)
##D writeRaster(temp[[4]], "20091106b3.tif", overwrite = T)
##D 
##D # Computing NDVI images: 
##D 
##D eco.NDVI(tab, "COST", "NDVI", "LT5")
##D 
##D # Mean NDVI image computed over the NDVI images that we calculated:
##D 
##D eco.NDVI.post(tab, "COST", "NDVI", what = c("mean", "var"))
##D mean.ndvi <- raster("NDVI.COST.mean.tif")
##D plot(mean.ndvi)
##D 
##D # Extraction of the mean NDVI for each point in the object eco and plot
##D # of the data:
##D 
##D ndvi <- extract(mean.ndvi, eco3[["XY"]])
##D ndvi<- aue.rescale(ndvi)
##D plot(eco3[["XY"]][, 1], eco3[["XY"]][, 2], col=rgb(ndvi, 0, 0),
##D pch=15, main = "Mean NDVI", xlab = "X", ylab  = "Y")
## End(Not run)

file.remove(c("NDVICOST20040719.tif", "NDVICOST20091106.tif",
"20040719b4.tif", "20040719b3.tif", "20091106b4.tif", 
"20091106b3.tif", "NDVI.COST.mean.tif", "NDVI.COST.var.tif",
"NDVICOSTtime.tif"))




