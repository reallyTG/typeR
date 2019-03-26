library(RPyGeo)


### Name: RPyGeo-package
### Title: RPyGeo: ArcGIS Geoprocessing in R via Python
### Aliases: RPyGeo RPyGeo-package

### ** Examples


# load the ArcPy module related to ArcGIS Pro (and save it as a R
# object called "arcpy_m") in R and also set the overwrite parameter
# to FALSE and add some extensions. Note that we do not have to set the path
# because the Python version is located in the default location
# (C:/Program Files/ArcGIS/Pro/bin/Python/envs/arcgispro-py3/)in this example.
## Not run: 
##D arcpy <- rpygeo_build_env(overwrite = TRUE,
##D                                      extensions = c("3d", "Spatial", "na"),
##D                                      pro = TRUE)
## End(Not run)
# Suppose we want to calculate the slope of a Digtial Elevation Model.
# It is possible to get the description of any ArcPy function as a R list:
## Not run: py_function_docs("arcpy$Slope_3d")
# Now we can run our computation:
## Not run: arcpy$Slope_3d(arcpy$Slope_3d(in_raster = "dem.tif", out_raster = "slope.tif")




