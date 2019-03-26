library(uavRst)


### Name: morpho_dem
### Title: calculates most important DEM parameters
### Aliases: morpho_dem

### ** Examples

## Not run: 
##D ##- required packages
##D require(uavRst)
##D require(link2GI)
##D setwd(tempdir())
##D giLinks<-list()
##D ## check if OTB exists
##D giLinks$otb <- link2GI::linkOTB()
##D giLinks$saga <- link2GI::linkSAGA()
##D giLinks$grass <- link2GI::linkGRASS7(returnPaths = TRUE)
##D if (giLinks$otb$exist & giLinks$saga$exist & giLinks$grass$exist) {
##D data("mrbiko")
##D proj = "+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"
##D mrbiko <- raster::projectRaster(mrbiko, crs = proj,method = "ngb",res = 20)
##D raster::writeRaster(mrbiko,"dem.tif",overwrite=TRUE)
##D r<-morpho_dem(dem="dem.tif",c("hillshade", "slope", "aspect", "TRI", "TPI",
##D                               "Roughness", "SLOPE", "ASPECT",  "C_GENE", "C_PROF",
##D                               "C_PLAN", " C_TANG"," C_LONG", "C_CROS"),
##D                               giLinks= giLinks)
##D r_st=raster::stack(r)
##D names(r_st)=names(r)
##D raster::plot(r_st)
##D }
## End(Not run)



