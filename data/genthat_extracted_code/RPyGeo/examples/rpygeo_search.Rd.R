library(RPyGeo)


### Name: rpygeo_search
### Title: Search for ArcPy functions and classes
### Aliases: rpygeo_search

### ** Examples


## Not run: 
##D # Load packages
##D library(RPyGeo)
##D library(magrittr)
##D library(RQGIS)
##D 
##D # Get data
##D data(dem, package = "RQGIS")
##D 
##D # Write data to disk
##D writeRaster(dem, file.path(tempdir(), "dem.tif"), format = "GTiff")
##D 
##D # Load the ArcPy module and build environment
##D arcpy <- rpygeo_build_env(overwrite = TRUE,
##D                           workspace = tempdir(),
##D                           extensions = "Spatial")
##D 
##D # Search for ArcPy functions, which contain the term slope
##D rpygeo_search("slope")
##D 
##D #> $toolbox
##D #> [1] "Slope_3d"        "SurfaceSlope_3d"
##D #>
##D #> $main
##D #> [1] "Slope_3d"        "SurfaceSlope_3d"
##D #>
##D #> $sa
##D #> [1] "Slope"
##D #>
##D #> $ddd
##D #> [1] "Slope"        "SurfaceSlope"
##D 
##D # Run function from sa module
##D arcpy$sa$Slope(in_raster="dem.tif")
##D 
##D # Run function from main module
##D arcpy$Slope_3d(in_raster="dem.tif")
## End(Not run)



