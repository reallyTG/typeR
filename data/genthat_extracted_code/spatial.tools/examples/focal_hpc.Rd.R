library(spatial.tools)


### Name: focal_hpc
### Title: Engine for performing fast, easy-to-develop pixel and focal
###   raster calculations with parallel processing capability.
### Aliases: focal_hpc

### ** Examples

library("raster")
 tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
# Pixel-based processing:
ndvi_function <- function(x)
{
# Note that x is received by the function as a 3-d array:
red_band <- x[,,2]
nir_band <- x[,,3]
ndvi <- (nir_band - red_band)/(nir_band + red_band)
# The output of the function should also be a 3-d array,
# even if it is a single band:
ndvi <- array(ndvi,dim=c(dim(x)[1],dim(x)[2],1))
return(ndvi)
}

sfQuickInit(cpus=2)
tahoe_ndvi <- focal_hpc(x=tahoe_highrez,fun=ndvi_function)
sfQuickStop()

## Not run: 
##D  
##D # Focal-based processing:
##D local_smoother <- function(x)
##D {
##D # Assumes a 3-d array representing
##D # a single local window, and return
##D # a single value or a vector of values.
##D smoothed <- apply(x,3,mean)
##D return(smoothed)
##D }
##D 
##D # Apply the function to a 3x3 window:
##D sfQuickInit(cpus=2)
##D tahoe_3x3_smoothed <- focal_hpc(x=tahoe_highrez,fun=local_smoother,window_dims=c(3,3))
##D sfQuickStop()
##D 
##D # Example with 7 x 7 window in full parallel mode:
##D sfQuickInit()
##D tahoe_7x7_smoothed <- focal_hpc(x=tahoe_highrez,fun=local_smoother,window_dims=c(7,7))
##D sfQuickStop()
## End(Not run)




