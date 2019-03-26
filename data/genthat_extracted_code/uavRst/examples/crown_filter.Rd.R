library(uavRst)


### Name: crown_filter
### Title: basic filtering of crown polygons using altitude, area and other
###   optional thresholds
### Aliases: crown_filter

### ** Examples

## Not run: 
##D 
##D  require(uavRst)
##D  require(link2GI)
##D 
##D # project folder
##D  projRootDir<-tempdir()
##D 
##D # create subfolders please mind that the pathes are exported as global variables
##D  paths<-link2GI::initProj(projRootDir = projRootDir,
##D                          projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                          global = TRUE,
##D                          path_prefix = "path_")
##D # overide trailing backslash issue
##D  setwd(path_run)
##D 
##D # get the data
##D utils::download.file("https://github.com/gisma/gismaData/raw/master/uavRst/data/crowns.zip",
##D                        paste0(path_run,"crowns.zip"))
##D unzip(zipfile = paste0(path_run,"crowns.zip"), exdir =".")
##D 
##D  raster::plot(raster::shapefile(paste0(path_run,"polyStat.shp")))
##D 
##D # start postclassification of segements
##D tree_crowns <- crown_filter(crownFn =  paste0(path_run,"polyStat.shp"),
##D                              minTreeAlt = 3,
##D                              minCrownArea = 20,
##D                              maxCrownArea = 50,
##D                              minTreeAltParam = "chmQ20" )
##D # visualize it
##D raster::plot(tree_crowns[[2]])
##D ##+
## End(Not run)




