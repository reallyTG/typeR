library(gdalUtils)


### Name: gdal_chooseInstallation
### Title: gdal_chooseInstallation
### Aliases: gdal_chooseInstallation

### ** Examples

## Not run: 
##D  
##D # Choose the best installation that has both HDF4 and HDF5 drivers:
##D gdal_chooseInstallation(hasDrivers=c("HDF4","HDF5"))
##D # Get the version of this installation:
##D getOption("gdalUtils_gdalPath")[[
##D 	gdal_chooseInstallation(hasDrivers=c("HDF4","HDF5"))]]$version
## End(Not run)



