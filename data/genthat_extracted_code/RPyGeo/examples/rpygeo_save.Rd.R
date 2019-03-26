library(RPyGeo)


### Name: rpygeo_save
### Title: Save temporary raster to workspace
### Aliases: rpygeo_save

### ** Examples


## Not run: 
##D # Load packages
##D library(RPyGeo)
##D library(RQGIS)
##D library(magrittr)
##D 
##D # Get data
##D data(dem, package = "RQGIS")
##D 
##D # Load the ArcPy module and build environment
##D arcpy <- arcpy_build_env(overwrite = TRUE, workspace = tempdir())
##D 
##D # Write raster to workspace directory
##D writeRaster(dem, file.path(tempdir(), "dem.tif"), format = "GTiff")
##D 
##D # Calculate temporary aspect file and save to workspace
##D arcpy$sa$Aspect(in_raster = "dem.tif") %>%
##D   rpygeo_save("aspect.tif")
## End(Not run)




