library(gdalUtils)


### Name: gdaltindex
### Title: gdaltindex
### Aliases: gdaltindex

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install
# and that raster and rgdal are also installed.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(require(rgdal) && valid_install)
{
# Modified example from the original gdaltindex documentation:
src_folder <- system.file("external/", package="gdalUtils")
output_shapefile <- paste(tempfile(),".shp",sep="")
# Command-line gdalwarp call:
# gdaltindex doq_index.shp external/*.tif
gdaltindex(output_shapefile,list.files(path=src_folder,pattern=glob2rx("*.tif"),full.names=TRUE),
	output_Vector=TRUE,verbose=TRUE)
}



