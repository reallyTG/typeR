library(spatial.tools)


### Name: rasterEngine
### Title: Engine for performing fast, easy-to-develop pixel and focal
###   raster calculations with parallel processing capability.
### Aliases: rasterEngine

### ** Examples

library("raster")
# Pixel-based processing on one band:
apply_multiplier <- function(inraster,multiplier)
{
# Note that inraster is received by this function as a 3-d array (col,row,band)
multiplied_raster <- inraster * multiplier
return(multiplied_raster)
}

tahoe_lidar_highesthit <-
setMinMax(raster(system.file(
"external/tahoe_lidar_highesthit.tif", package="spatial.tools")))

# Note that you can use any parallel backend that can be registered with foreach.
# sfQuickInit() will spawn a PSOCK cluster using the parallel package.
# sfQuickInit(cpus=2)
tahoe_lidar_highesthit_multiplied <- rasterEngine(
inraster=tahoe_lidar_highesthit,
fun=apply_multiplier,
args=list(multiplier=3.28084))
# sfQuickStop()
 
## Not run: 
##D  
##D # Pixel-based processing on more than one band: 
##D ndvi <- function(GRNIR_image)
##D {
##D # The input array will have dim(GRNIR_image)[3] equal
##D # to 3, because the input image has three bands.
##D # Note: the following two lines return an array,
##D # so we don't need to manually set the dim(ndvi) at the
##D # end.  If we didn't use drop=FALSE, we'd need to
##D # coerce the output into a 3-d array before returning it.
##D red_band <- GRNIR_image[,,2,drop=FALSE]
##D nir_band <- GRNIR_image[,,3,drop=FALSE]
##D ndvi <- (nir_band - red_band)/(nir_band + red_band)
##D # The following is not needed in this case:
##D # dim(ndvi) <- c(dim(GRNIR_image)[1],dim(GRNIR_image)[2],1)
##D return(ndvi)
##D }
##D 
##D tahoe_highrez <- setMinMax(
##D brick(system.file("external/tahoe_highrez.tif", package="spatial.tools")))
##D 
##D sfQuickInit(cpus=2)
##D tahoe_ndvi <- rasterEngine(GRNIR_image=tahoe_highrez,fun=ndvi)
##D sfQuickStop()
##D 
##D # Focal-based processing:
##D mean_smoother <- function(inraster)
##D {
##D smoothed <- apply(inraster,3,mean)
##D return(smoothed)
##D }
##D 
##D # Apply the function to a 3x3 window:
##D sfQuickInit(cpus=2)
##D tahoe_3x3_smoothed <- rasterEngine(inraster=tahoe_highrez,fun=mean_smoother,window_dims=c(3,3))
##D sfQuickStop()
##D 
##D # Example with 7 x 7 window in full parallel mode:
##D sfQuickInit()
##D tahoe_7x7_smoothed <- rasterEngine(inraster=tahoe_highrez,fun=mean_smoother,window_dims=c(7,7))
##D sfQuickStop()
## End(Not run)



