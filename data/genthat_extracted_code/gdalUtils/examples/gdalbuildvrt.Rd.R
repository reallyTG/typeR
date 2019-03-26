library(gdalUtils)


### Name: gdalbuildvrt
### Title: gdalbuildvrt
### Aliases: gdalbuildvrt

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(valid_install)
{
layer1 <- system.file("external/tahoe_lidar_bareearth.tif", package="gdalUtils")
layer2 <- system.file("external/tahoe_lidar_highesthit.tif", package="gdalUtils")
output.vrt <- paste(tempfile(),".vrt",sep="")
gdalbuildvrt(gdalfile=c(layer1,layer2),output.vrt=output.vrt,separate=TRUE,verbose=TRUE)
gdalinfo(output.vrt)
}



