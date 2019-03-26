library(uavRst)


### Name: predict_rgb
### Title: classify images using raster predict
### Aliases: predict_rgb

### ** Examples

## Not run: 
##D ##- required packages
##D require(uavRst)
##D require(link2GI)
##D 
##D ##- project folder
##D projRootDir<-tempdir()
##D 
##D ##-create subfolders pls notice the pathes are exported as global variables
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                         projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                         global = TRUE,
##D                         path_prefix = "path_")
##D setwd(path_run)
##D unlink(paste0(path_run,"*"), force = TRUE)
##D 
##D ##- get the tutorial data
##D utils::download.file("https://github.com/gisma/gismaData/raw/master/uavRst/data/ffs.zip",
##D paste0(path_run,"ffs.zip"))
##D unzip(zipfile =  paste0(path_run,"ffs.zip"), exdir = ".")
##D 
##D ##- assign tutorial data
##D imageFile <- paste0(path_run,"predict.tif")
##D load(paste0(path_run,"tutorialbandNames.RData"))
##D tutorialModel<-readRDS(file = paste0(path_run,"tutorialmodel.rds"))
##D 
##D ##- start the  prediction taking the non optimized model
##D ##- please note the output is saved in the subdirectory path_output
##D predict_rgb(imageFiles=imageFile,
##D             model = tutorialModel[[1]],
##D             bandNames = bandNames)
##D 
##D ##- visualise the classification
##D raster::plot(raster::raster(paste0(path_output,"classified_predict.tif")))
##D ##+
## End(Not run)



