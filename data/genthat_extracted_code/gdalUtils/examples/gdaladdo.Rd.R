library(gdalUtils)


### Name: gdaladdo
### Title: gdaladdo
### Aliases: gdaladdo

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(valid_install)
{
filename  <- system.file("external/tahoe_highrez.tif", package="gdalUtils")
temp_filename <- paste(tempfile(),".tif",sep="")
file.copy(from=filename,to=temp_filename,overwrite=TRUE)
gdalinfo(filename)
gdaladdo(r="average",temp_filename,levels=c(2,4,8,16),verbose=TRUE)
gdalinfo(temp_filename)
}



