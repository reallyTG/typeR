library(uavRst)


### Name: poly_stat
### Title: Calculate descriptive statistics of raster as segemented by
###   polygons
### Aliases: poly_stat

### ** Examples

## Not run: 
##D # required packages
##D require(uavRst)
##D require(link2GI)
##D 
##D # create and check the links to the GI software
##D giLinks<-uavRst::linkAll(linkItems = c("saga","gdal"))
##D if (giLinks$saga$exist) {
##D 
##D # get the rgb image, chm and training data
##D url <- "https://github.com/gisma/gismaData/raw/master/uavRst/data/tutorial_data.zip"
##D utils::download.file(url, file.path(tempdir(),"tutorial_data.zip"))
##D unzip(zipfile = file.path(tempdir(),"tutorial_data.zip"), exdir = tempdir())
##D 
##D polyStat <- poly_stat("chm_3-3_train1",
##D                       spdf = "rgb_3-3_train1.shp",
##D                       giLinks=giLinks)
##D                       
##D raster::plot(polyStat)
##D }
##D ##+
## End(Not run)




