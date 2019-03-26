library(RPyGeo)


### Name: rpygeo_build_env
### Title: Initialize ArcPy site-package in R
### Aliases: rpygeo_build_env

### ** Examples


## Not run: 
##D # Load ArcPy side-package of ArcGIS Pro with 3D and Spatial Analysis extension.
##D # Set environment setting 'overwrite' to TRUE.
##D # Note that no path parameter is necessary because Python is located in the
##D # default location.
##D arcpy <- rpygeo_build_env(overwrite = TRUE,
##D                           extensions = c("3d", "Spatial"),
##D                           pro = TRUE)
## End(Not run)

# Load the ArcPy module when your Python version is located in a different
# folder




