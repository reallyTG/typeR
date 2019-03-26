library(gdalUtils)


### Name: gdal_contour
### Title: gdal_contour
### Aliases: gdal_contour

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install
# and that raster and rgdal are also installed.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(require(raster) && require(rgdal) && valid_install)
{
# Example from the original gdal_contour documentation:
# 	gdal_contour -a elev dem.tif contour.shp -i 10.0 
# Choose a DEM:
input_dem  <- system.file("external/tahoe_lidar_bareearth.tif", package="gdalUtils")
# Setup an output filename (shapefile):
output_shapefile <- paste(tempfile(),".shp",sep="")
contour_output <- gdal_contour(src_filename=input_dem,dst_filename=output_shapefile,
		a="Elevation",i=5.,output_Vector=TRUE)
# Plot the contours using spplot:
spplot(contour_output["Elevation"],contour=TRUE)
}



