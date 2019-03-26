library(gdalUtils)


### Name: ogrtindex
### Title: ogrtindex
### Aliases: ogrtindex

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(require(rgdal) && valid_install)
{
	tempindex <- tempfile(fileext=".shp")
	src_dir <- system.file("external/", package="gdalUtils")
	src_files <- list.files(src_dir,pattern=".shp",full.names=TRUE)
	ogrtindex(output_dataset=tempindex,src_dataset=src_files,
			accept_different_schemas=TRUE,output_Vector=TRUE)
}



