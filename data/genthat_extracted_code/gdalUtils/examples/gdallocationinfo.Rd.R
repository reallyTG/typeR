library(gdalUtils)


### Name: gdallocationinfo
### Title: gdallocationinfo
### Aliases: gdallocationinfo

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install
# and that raster and rgdal are also installed.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(valid_install)
{
	src_dataset <- system.file("external/tahoe_highrez.tif", package="gdalUtils")
	# Raw output of a single coordinate:
	gdallocationinfo(srcfile=src_dataset,x=10,y=10)

	# A matrix of coordinates and a clean, matrix output:
	coords <- rbind(c(10,10),c(20,20),c(30,30))
	gdallocationinfo(srcfile=src_dataset,coords=coords,valonly=TRUE,raw_output=FALSE)
}



