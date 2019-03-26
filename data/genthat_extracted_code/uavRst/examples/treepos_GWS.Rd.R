library(uavRst)


### Name: treepos_GWS
### Title: Find potential tree positions using a canopy height model
### Aliases: treepos_GWS

### ** Examples

## Not run: 
##D 
##D # required packages
##D require(uavRst)
##D require(link2GI)
##D 
##D # create and check the links to the GI software
##D giLinks<-uavRst::linkAll()
##D if (giLinks$saga$exist & giLinks$otb$exist & giLinks$grass$exist) {
##D 
##D # project folder
##D projRootDir<-tempdir()
##D 
##D # create subfolders please mind that the pathes are exported as global variables
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                          projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                          global = TRUE,
##D                          path_prefix = "path_")
##D 
##D  data(chm_seg)
##D 
##D # calculate treepos using uavRst generic approach
##D  tPos <- uavRst::treepos_GWS(chm = chm_seg[[1]],
##D                          minTreeAlt = 2,
##D                          maxCrownArea = 150,
##D                          join = 1,
##D                          thresh = 0.35,
##D                          split=TRUE,
##D                          cores=1,
##D                          giLinks = giLinks )
##D }
##D ##+
## End(Not run)




