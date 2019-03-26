library(uavRst)


### Name: pc_2D_dsm
### Title: Create a Digital Terrain Model from UAV generated point clouds
###   by minimum altitude sampling
### Aliases: pc_2D_dsm

### ** Examples

## Not run: 
##D require(uavRst)
##D require(link2GI)
##D 
##D # create and check the links to the GI software
##D giLinks<-list()
##D giLinks$grass<-link2GI::linkGRASS7(returnPaths = TRUE)
##D if (giLinks$grass$exist) {
##D 
##D # proj subfolders
##D owd <- getwd()
##D projRootDir<-tempdir()
##D unlink(paste0(projRootDir,"*"), force = TRUE)
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                          projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                          global = TRUE,
##D                          path_prefix = "path_")
##D # get some colors
##D pal = mapview::mapviewPalette("mapviewTopoColors")
##D 
##D # get the data
##D utils::download.file(url="https://github.com/gisma/gismaData/raw/master/uavRst/data/lidar.las",
##D destfile="lasdata.las")
##D 
##D # create 2D pointcloud DSM
##D dsm <- pc_2D_dsm(laspcFile = "lasdata.las",
##D                 gisdbasePath = projRootDir,
##D                 sampleMethod = "max",
##D                 targetGridSize = 0.5,
##D                 giLinks = giLinks)
##D                 }
##D  raster::plot(dsm)
##D  setwd(owd)
## End(Not run)



