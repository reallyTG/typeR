library(uavRst)


### Name: ffs_train
### Title: Forward feature selection based on rf model
### Aliases: ffs_train

### ** Examples

## Not run: 
##D require(uavRst)
##D 
##D ##- project folder
##D projRootDir<-tempdir()
##D 
##D # create subfolders please mind that the pathes are exported as global variables
##D paths<-link2GI::initProj(projRootDir = projRootDir,
##D                          projFolders = c("data/","data/ref/","output/","run/","las/"),
##D                          global = TRUE,
##D                          path_prefix = "path_")
##D setwd(path_run)
##D unlink(paste0(path_run,"*"), force = TRUE)
##D 
##D ##- get the rgb image, chm and training data
##D utils::download.file("https://github.com/gisma/gismaData/raw/master/uavRst/data/ffs.zip",
##D                       paste0(path_run,"ffs.zip"))
##D unzip(zipfile = paste0(path_run,"ffs.zip"),exdir = ".")
##D 
##D ##- get geometrical training data assuming that you have used before the calc_ext function
##D trainDF<-readRDS(paste0(path_run,"tutorial_trainDF.rds"))
##D load(paste0(path_run,"tutorialbandNames.RData"))
##D 
##D ##- define the classes
##D  idNumber=c(1,2,3)
##D  idNames= c("green tree","yellow tree","no tree")
##D ##- add classes names
##D  for (i in 1:length(idNumber)){
##D    trainDF$ID[trainDF$ID==i]<-idNames[i]
##D  }
##D ##- convert to factor (required by rf)
##D  trainDF$ID <- as.factor(trainDF$ID)
##D ##- now prepare the predictor and response variable names
##D ##- get actual name list from the DF
##D  name<-names(trainDF)
##D ##- cut leading and tailing ID/FN
##D  predictNames<-name[3:length(name)-1]
##D 
##D ##- call Training
##D  model <-  ffs_train(trainingDF= trainDF,
##D                      predictors= predictNames,
##D                      response  = "ID",
##D                      spaceVar  = "FN",
##D                      names     = name,
##D                      pVal      = 0.1,
##D                      noClu     = 1)
##D 
##D ##- for classification/prediction go ahead with the predict_RGB function
##D ##+
## End(Not run)



