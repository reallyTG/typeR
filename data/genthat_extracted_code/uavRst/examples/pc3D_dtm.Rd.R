library(uavRst)


### Name: pc3D_dtm
### Title: create a Digital Terrain Model from preclassified point cloud
###   data
### Aliases: pc3D_dtm

### ** Examples

## Not run: 
##D require(uavRst)
##D require(link2GI)
##D 
##D # create and check the links to the GI software
##D giLinks<-list()
##D giLinks$saga<-link2GI::linkSAGA()
##D if (giLinks$saga$exist) {
##D # proj subfolders
##D projRootDir<-tempdir()
##D unlink(paste0(projRootDir,"*"), force = TRUE)
##D projsubFolders<-c("data/","data/ref/","output/","run/","las/")
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                         projFolders = projsubFolders,
##D                         global = TRUE,
##D                         path_prefix = "path_")
##D setwd(paste0(projRootDir,"run"))
##D # get some colors
##D pal = mapview::mapviewPalette("mapviewTopoColors")
##D 
##D # get the data
##D utils::download.file(url="https://github.com/gisma/gismaData/raw/master/uavRst/data/lidar.las",
##D                     destfile="lasdata.las")
##D 
##D # create a DSM  based on a uav point cloud
##D pc3DTM <- pc3D_dtm(lasDir =  "lasdata.las",
##D                       gisdbasePath = projRootDir,
##D                       projsubFolders = projsubFolders,
##D                       thinGrid = 1.,
##D                       splineNumber = 5 ,
##D                       gridSize = 0.5,
##D                       giLinks = giLinks)
##D mapview::mapview(pc3DTM[[1]]) 
##D }
## End(Not run)



