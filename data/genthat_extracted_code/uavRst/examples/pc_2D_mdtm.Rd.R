library(uavRst)


### Name: pc_2D_mdtm
### Title: Create a Digital Terrain Model from UAV generated point clouds
###   by minimum altitude sampling (multiple resolutions of sampling
###   gridsize)
### Aliases: pc_2D_mdtm

### ** Examples

## Not run: 
##D 
##D require(uavRst)
##D require(link2GI)
##D 
##D # create and check the links to the GI software
##D giLinks<-list()
##D giLinks$grass<-link2GI::linkGRASS7(returnPaths = TRUE)
##D if (giLinks$grass$exist) {
##D 
##D # get the data
##D utils::download.file(url="https://github.com/gisma/gismaData/raw/master/uavRst/data/lidar.las",
##D                      destfile="lasdata.las")
##D 
##D # create 2D point cloud DTM
##D dtm3 <- pc_2D_mdtm(laspcFile = "lasdata.las",
##D                    gisdbasePath = tempdir(),
##D                    tension = 20 ,
##D                    targetGridSize = 0.5,
##D                    sampleGridSize = c(100, 50, 25),
##D                    giLinks = giLinks)
##D  raster::plot(dtm3)
##D }
## End(Not run)



