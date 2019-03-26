library(uavRst)


### Name: pc_2D_fdtm
### Title: Create a Digital Terrain Model from UAV generated point clouds
###   by minimum altitude sampling (fix resolution of sampling gridsize)
### Aliases: pc_2D_fdtm

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
##D projRootDir<-tempdir()
##D unlink(paste0(projRootDir,"*"), force = TRUE)
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                          projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                          global = TRUE,
##D                          path_prefix = "path_")
##D  
##D # get some colors
##D pal = mapview::mapviewPalette("mapviewTopoColors")
##D 
##D # get the data
##D utils::download.file(url="https://github.com/gisma/gismaData/raw/master/uavRst/data/lidar.las",
##D destfile=paste0("lasdata.las"))
##D 
##D # create 2D point cloud DTM
##D dtm <- pc_2D_fdtm(laspcFile = "lasdata.las",
##D                 gisdbasePath = projRootDir,
##D                 tension = 20 ,
##D                 sampleGridSize = 25,
##D                 targetGridSize = 0.5,
##D                 giLinks = giLinks)
##D                 
##D mapview::mapview(dtm)                 
##D                 }
##D 
## End(Not run)



