library(RPyGeo)


### Name: rpygeo_load
### Title: Load output of ArcPy functions into R session
### Aliases: rpygeo_load

### ** Examples


## Not run: 
##D # Load packages
##D library(RPyGeo)
##D library(magrittr)
##D library(RQGIS)
##D library(spData)
##D 
##D # Get data
##D data(dem, package = "RQGIS")
##D data(nz, package = "spData")
##D 
##D # Write data to disk
##D writeRaster(dem, file.path(tempdir(), "dem.tif"), format = "GTiff")
##D st_write(nz, file.path(tempdir(), "nz.shp"))
##D 
##D # Load the ArcPy module and build environment
##D arcpy <- arcpy_build_env(overwrite = TRUE, workspace = tempdir())
##D 
##D # Create a slope raster and load it into the R session (Example 1)
##D slope <-
##D   arcpy$Slope_3d(in_raster = "dem.tif", out_raster = "slope.tif") %>%
##D   rpygeo_load()
##D 
##D # Create a aspect raster and load it into the R session (Example 2)
##D ras_aspect <- arcpy$sa$Aspect(in_raster = "dem.tif")
##D rpygeo_load(ras_aspect)
##D 
##D # Convert elevation raster to polygon shapefile and load it into R session (Example 3)
##D arcpy$RasterToPolygon_conversion("dem.tif", "elev.shp")
##D rpygeo_load("elev.shp")
## End(Not run)




