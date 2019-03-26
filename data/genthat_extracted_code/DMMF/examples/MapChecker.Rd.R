library(DMMF)


### Name: MapChecker
### Title: Map checker for raster layers
### Aliases: MapChecker

### ** Examples

## Not run: 
##D ## Load example data for test running B_Checker function
##D data(Potato.Convex)
##D attach(Potato.Convex)
##D ## Run B_Checker function with original DEM which has internal sinks.
##D DEM <- s.map$DEM_original
##D MapCheck <- MapChecker( DEM )
##D ## Check maps
##D par(mfrow=c(2,2))
##D plot(DEM)
##D plot(MapCheck$boundary)
##D plot(MapCheck$sink)
##D plot(MapCheck$stand)
## End(Not run)



