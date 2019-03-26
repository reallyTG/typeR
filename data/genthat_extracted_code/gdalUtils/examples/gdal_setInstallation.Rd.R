library(gdalUtils)


### Name: gdal_setInstallation
### Title: gdal_setInstallation
### Aliases: gdal_setInstallation

### ** Examples

## Not run: 
##D  
##D # Assumes you have GDAL installed on your local machine.
##D getOption("gdalUtils_gdalPath")
##D gdal_setInstallation()
##D getOption("gdalUtils_gdalPath")
##D # If there is more than one installation of GDAL, this is the 
##D # most recent installation:
##D getOption("gdalUtils_gdalPath")[[1]]
##D # The version number:
##D getOption("gdalUtils_gdalPath")[[1]]$version
## End(Not run)



