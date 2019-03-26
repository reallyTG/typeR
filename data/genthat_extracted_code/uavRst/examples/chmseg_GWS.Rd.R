library(uavRst)


### Name: chmseg_GWS
### Title: seeded region growing tree crown segmentation based on 'SAGA
###   GIS'
### Aliases: chmseg_GWS

### ** Examples

## Not run: 
##D ##- required packages
##D require(uavRst)
##D require(link2GI)
##D ##- linkages
##D ##- create and check the links to the GI software
##D giLinks<-uavRst::linkAll(linkItems = c("saga","gdal"))
##D if (giLinks$saga$exist ) {
##D 
##D ##- project folder
##D projRootDir<-tempdir()
##D 
##D ##- create subfolders please mind that the pathes are exported as global variables
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                          projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                          global = TRUE,
##D                          path_prefix = "path_")
##D ##- overide trailing backslash issue
##D  path_run<-ifelse(Sys.info()["sysname"]=="Windows", sub("/$", "",path_run),path_run)
##D  setwd(path_run)
##D  unlink(paste0(path_run,"*"), force = TRUE)
##D 
##D ##- get the data
##D  data(chm_seg)
##D  data(trp_seg)
##D 
##D ##- tree segmentation
##D crowns_GWS <- chmseg_GWS( treepos = trp_seg[[1]],
##D                       chm = chm_seg[[1]],
##D                       minTreeAlt = 10,
##D                       neighbour = 0,
##D                       thVarFeature = 1.,
##D                       thVarSpatial = 1.,
##D                       thSimilarity = 0.003,
##D                       giLinks = giLinks )[[2]]
##D 
##D ##- visualize it
##D raster::plot(crowns_GWS)
##D }
## End(Not run)



