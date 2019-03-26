library(mitools)


### Name: imputationList
### Title: Constructor for imputationList objects
### Aliases: imputationList print.imputationList rbind.imputationList
###   cbind.imputationList dimnames.imputationList dim.imputationList
###   update.imputationList imputationList.default imputationList.character
### Keywords: manip

### ** Examples

## Not run: 
##D ## CRAN doesn't like this example
##D data.dir <- system.file("dta",package="mitools")
##D files.men <- list.files(data.dir,pattern="m.\\.dta$",full=TRUE)
##D men <- imputationList(lapply(files.men, foreign::read.dta))
##D files.women <- list.files(data.dir,pattern="f.\\.dta$",full=TRUE)
##D women <- imputationList(lapply(files.women, foreign::read.dta))
##D men <- update(men, sex=1)
##D women <- update(women,sex=0)
##D all <- rbind(men,women)
##D all <- update(all, drinkreg=as.numeric(drkfre)>2)
##D all
## End(Not run)



