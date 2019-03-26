library(sdm)


### Name: read.sdm
### Title: read/write sdm* object from/to a file
### Aliases: read.sdm read.sdm,character-method write.sdm
###   write.sdm,sdmModels,character-method
###   write.sdm,sdmdata,character-method
###   write.sdm,.sdmCorSetting,character-method
### Keywords: write, write sdm

### ** Examples

## Not run: 
##D 
##D file <- system.file("external/data.sdd", package="sdm")
##D 
##D d <- read.sdm(file)
##D 
##D d
##D # can be used to read sdm models (sdmModels) and sdmSettings as well.
##D 
##D write.sdm(d,'dataset') 
##D # extension is created for data, model and settings as .sdd, .sds, and .sdm respectively.
##D 
##D list.files(pattern='dataset')
## End(Not run)



