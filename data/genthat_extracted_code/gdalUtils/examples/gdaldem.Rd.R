library(gdalUtils)


### Name: gdaldem
### Title: gdaldem
### Aliases: gdaldem

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install
# and that raster and rgdal are also installed.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(require(raster) && require(rgdal) && valid_install)
{
# We'll pre-check for a proper GDAL installation before running these examples:
gdal_setInstallation()
if(!is.null(getOption("gdalUtils_gdalPath")))
{
input_dem  <- system.file("external/tahoe_lidar_highesthit.tif", package="gdalUtils")
plot(raster(input_dem),col=gray.colors(256))

# Hillshading:
# Command-line gdaldem call:
# gdaldem hillshade tahoe_lidar_highesthit.tif output_hillshade.tif
output_hillshade <- gdaldem(mode="hillshade",input_dem=input_dem,
output="output_hillshade.tif",output_Raster=TRUE,verbose=TRUE)
plot(output_hillshade,col=gray.colors(256))

# Slope:
# Command-line gdaldem call:
# gdaldem slope tahoe_lidar_highesthit.tif output_slope.tif -p
output_slope <- gdaldem(mode="slope",input_dem=input_dem,
output="output_slope.tif",p=TRUE,output_Raster=TRUE,verbose=TRUE)
plot(output_slope,col=gray.colors(256))

# Aspect:
# Command-line gdaldem call:
# gdaldem aspect tahoe_lidar_highesthit.tif output_aspect.tif
output_aspect <- gdaldem(mode="aspect",input_dem=input_dem,
output="output_aspect.tif",output_Raster=TRUE,verbose=TRUE)
plot(output_aspect,col=gray.colors(256))
}
}



