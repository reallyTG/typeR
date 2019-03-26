library(gdalUtils)


### Name: ogrinfo
### Title: ogrinfo
### Aliases: ogrinfo

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(valid_install)
{
datasource_name <- system.file("external/tahoe_highrez_training.shp", package="gdalUtils")
# Display all available formats:
# Command-line ogrinfo call:
# ogrinfo --formats
ogrinfo(formats=TRUE)

# Get info on an entire shapefile:
# ogrinfo tahoe_highrez_training.shp
ogrinfo(datasource_name)

# Get info on the layer of the shapefile:
# ogrinfo tahoe_highrez_training.shp tahoe_highrez_training
ogrinfo(datasource_name,"tahoe_highrez_training")
}



