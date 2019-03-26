library(uavRst)


### Name: pc3D_dsm
### Title: Create a Digital Surface Model from a UAV generated point cloud
### Aliases: pc3D_dsm

### ** Examples

## Not run: 
##D require(uavRst)
##D require(link2GI)
##D 
##D # create and check the links to the GI software
##D giLinks<-uavRst::linkAll()
##D (giLinks$saga$exist & giLinks$otb$exist & giLinks$grass$exist) 
##D {
##D # proj subfolders
##D projRootDir<-tempdir()
##D setwd(projRootDir)
##D unlink(paste0(projRootDir,"*"), force = TRUE)
##D 
##D projsubFolders<-c("data/","data/ref/","output/","run/","las/")
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                         projFolders = projsubFolders,
##D                         global = TRUE,
##D                         path_prefix = "path_")
##D # get some colors
##D pal = mapview::mapviewPalette("mapviewTopoColors")
##D 
##D # get the data
##D utils::download.file(url="https://github.com/gisma/gismaData/raw/master/uavRst/data/lidar.las",
##D                     destfile="lasdata.las")
##D 
##D # create a DSM  based on a uav point cloud
##D pc3DSM<-pc3D_dsm(lasDir =  "lasdata.las",
##D         gisdbasePath = projRootDir,
##D         projsubFolders = projsubFolders,
##D         gridSize = "0.5",
##D         giLinks = giLinks)
##D mapview::mapview(pc3DSM[[1]])
##D }
##D ##+
## End(Not run)




