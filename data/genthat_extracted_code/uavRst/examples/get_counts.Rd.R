library(uavRst)


### Name: get_counts
### Title: counts pixel values according to their classes
### Aliases: get_counts

### ** Examples

## Not run: 
##D ##- required packages
##D  require(uavRst)
##D 
##D ##- project root folder
##D  setwd(tempdir())
##D 
##D 
##D ##- get the rgb image, chm and training data
##D  utils::download.file("https://github.com/gisma/gismaData/raw/master/uavRst/data/tutorial.zip",
##D                       "tutorial_data.zip")
##D  unzip(zipfile = "tutorial_data.zip" ,
##D          exdir = ".")
##D 
##D # read data
##D  position <- raster::shapefile("position.shp")
##D  imageFiles <-Sys.glob(paths = paste0("rgb*","tif"))
##D  imageTrainStack<-lapply(imageFiles, FUN=raster::stack)
##D 
##D ## get counts
##D  df1<-get_counts(position = position,
##D                       ids = c(100,200),
##D                imageFiles = imageFiles,
##D                 outPrefix = "",
##D                       ext = ".tif",
##D                      path = tempdir())
##D head(df1)
##D ##+
## End(Not run)



