library(secr)


### Name: raster
### Title: Create a RasterLayer Object from Mask or Dsurface
### Aliases: raster raster,mask-method raster,Dsurface-method
### Keywords: methods spatial

### ** Examples


## Not run: 
##D 
##D shorePossums <- predictDsurface(possum.model.Ds)
##D tmp <- raster(shorePossums, covariate = "D.0")
##D library(raster)
##D plot(tmp, useRaster = FALSE)
##D 
##D ## alternative with same result
##D tmp <- raster(shorePossums, values = covariates(shorePossums)$D.0)
##D 
##D ## set the projection
##D ## here the crs PROJ.4 spec refers simply to the old NZ metric grid
##D tmp <- raster(shorePossums, "D.0", crs = "+proj=nzmg")
##D ## check the projection
##D proj4string(tmp)
##D      
## End(Not run)




