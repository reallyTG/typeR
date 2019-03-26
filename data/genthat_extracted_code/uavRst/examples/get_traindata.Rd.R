library(uavRst)


### Name: get_traindata
### Title: Extracts training data from a raster stack using vector data as
###   a mask.
### Aliases: get_traindata

### ** Examples

## Not run: 
##D ##- required packages
##D require(uavRst)
##D setwd(tempdir())
##D 
##D ##- get the tutorial data
##D utils::download.file("https://github.com/gisma/gismaData/raw/master/uavRst/data/tutorial_data.zip",
##D                      "tutorial_data.zip")
##D unzip("tutorial_data.zip",exdir =  ".")
##D 
##D ##- get the files
##D imageTrainStack <- list()
##D geomTrainStack <- list()
##D imageTrainFiles <- Sys.glob("rgb??.tif")
##D geomTrainFiles <- Sys.glob("rgb??.shp")
##D 
##D ##- create stacks from image and geometry files
##D imageTrainStack<-lapply(imageTrainFiles, FUN=raster::stack)
##D geomTrainStack  <- lapply(geomTrainFiles, FUN=raster::shapefile)
##D names(imageTrainStack[[1]])<-c("red","green","blue")
##D names(imageTrainStack[[2]])<-c("red","green","blue")
##D names(imageTrainStack[[3]])<-c("red","green","blue")
##D 
##D ##' finally extraxt the training data to a data frame
##D trainDF <- get_traindata(rasterStack  = imageTrainStack,
##D                         trainPlots = geomTrainStack)
##D 
##D ##- have a look at the training data
##D head(trainDF)
## End(Not run)



