library(gdalUtils)


### Name: gdalsrsinfo
### Title: gdalsrsinfo
### Aliases: gdalsrsinfo

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(valid_install)
{
src_dataset <- system.file("external/tahoe_highrez.tif", package="gdalUtils")
# Command-line gdalsrsinfo call:
# gdalsrsinfo -o proj4 tahoe_highrez.tif
gdalsrsinfo(src_dataset,o="proj4",verbose=TRUE)
# Export as CRS:
gdalsrsinfo(src_dataset,as.CRS=TRUE,verbose=TRUE)
}



