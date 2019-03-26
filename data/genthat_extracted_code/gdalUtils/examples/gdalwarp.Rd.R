library(gdalUtils)


### Name: gdalwarp
### Title: gdalwarp
### Aliases: gdalwarp

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install
# and that raster and rgdal are also installed.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(require(raster) && require(rgdal) && valid_install)
{
# Example from the original gdal_translate documentation:
src_dataset <- system.file("external/tahoe_highrez.tif", package="gdalUtils")
# Command-line gdalwarp call:
# gdalwarp -t_srs '+proj=utm +zone=11 +datum=WGS84' raw_spot.tif utm11.tif
gdalwarp(src_dataset,dstfile="tahoe_highrez_utm11.tif",
		t_srs='+proj=utm +zone=11 +datum=WGS84',output_Raster=TRUE,
		overwrite=TRUE,verbose=TRUE)
}



