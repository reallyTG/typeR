library(RPyGeo)


### Name: %rpygeo_-%
### Title: Subtraction operator
### Aliases: %rpygeo_-%

### ** Examples


## Not run: 
##D # Load the ArcPy module and build environment
##D arcpy <- arcpy_build_env(overwrite = TRUE, workspace = "C:/workspace")
##D 
##D # Write raster to workspace directory
##D writeRater(elev, "C:/workspace/elev.tif", extensions = "Spatial")
##D 
##D # Create raster object
##D ras <- arcpy$sa$Raster("elev.tif")
##D 
##D # Substract raster from itself
##D ras %rpygeo_+% ras %>%
##D   rpygeo_load()
## End(Not run)



