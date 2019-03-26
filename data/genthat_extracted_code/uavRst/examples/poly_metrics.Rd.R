library(uavRst)


### Name: poly_metrics
### Title: calculate morphometric features of polygons.
### Aliases: poly_metrics

### ** Examples


## Not run: 
##D # required packages
##D require(uavRst)
##D require(mapview)
##D 
##D # get the rgb image, chm and training data
##D utils::download.file("https://github.com/gisma/gismaData/raw/master/uavRst/data/tutorial_data.zip",
##D                       paste0(tempdir(),"tutorial_data.zip"))
##D unzip(zipfile = paste0(tempdir(),"tutorial_data.zip"), exdir = tempdir())
##D crown<-raster::shapefile(paste0(tempdir(),"rgb_3-3_train2.shp"))
##D ## calculate polygon morpho metrics
##D polymetric <- poly_metrics(crown)
##D 
##D # visualize it
##D mapview::mapview(polymetric)
##D ##+
## End(Not run)



