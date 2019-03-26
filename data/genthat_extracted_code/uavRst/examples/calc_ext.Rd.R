library(uavRst)


### Name: calc_ext
### Title: Convenient function to preprocess synthetic raster bands from a
###   given RGB image and/or DTM/DSM data.
### Aliases: calc_ext

### ** Examples

## Not run: 
##D 
##D ##- required packages
##D require(uavRst)
##D require(link2GI)
##D 
##D # create and check the links to the GI software
##D giLinks<-uavRst::linkAll()
##D if (giLinks$saga$exist & giLinks$otb$exist){
##D #'
##D ##- create and set folders
##D ##- please mind that the pathes are exported as global variables
##D paths<-link2GI::initProj(projRootDir = tempdir(),
##D                          projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                          global = TRUE,
##D                          path_prefix = "path_")
##D 
##D ##- clean runtime folder
##D unlink(paste0(path_run,"*"), force = TRUE)
##D 
##D ##- get the tutorial data
##D utils::download.file("https://github.com/gisma/gismaData/raw/master/uavRst/data/tutorial_data.zip",
##D                      paste0(path_run,"tutorial_data.zip"))
##D unzip(zipfile = paste0(path_run,"tutorial_data.zip"), exdir = R.utils::getAbsolutePath(path_run))
##D 
##D ##- calculate some synthetic channels from the RGB image and the canopy height model
##D ##- then extract the from the corresponding training geometries the data values aka trainingdata
##D trainDF <- calc_ext(calculateBands    = TRUE,
##D                     extractTrain      = TRUE,
##D                     suffixTrainGeom   = "",
##D                     patternIdx        = "index",
##D                     patternImgFiles   = "rgb" ,
##D                     patterndemFiles   = "chm",
##D                     prefixRun         = "tutorial",
##D                     prefixTrainImg    = "",
##D                     rgbi              = TRUE,
##D                     indices           = c("TGI","CI"),
##D                     channels          = c("red"),
##D                     rgbTrans          = FALSE,
##D                     hara              = FALSE,
##D                     haraType          = c("simple"),
##D                     stat              = FALSE,
##D                     edge              = FALSE,
##D                     morpho            = FALSE,
##D                     pardem            = TRUE,
##D                     demType           = c("slope", "MTPI"),
##D                     kernel            = 3,
##D                     currentDataFolder = path_run,
##D                     currentIdxFolder  = path_run,
##D                     giLinks = giLinks)
##D 
##D ##- show the result
##D head(trainDF)
##D # use ffs_train as next step for rf classification issues
##D }
##D ##+
## End(Not run)



