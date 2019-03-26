library(rNOMADS)


### Name: GetDODSModelRunInfo
### Title: Get model coverage and data information for models on GrADS-DODS
###   system.
### Aliases: GetDODSModelRunInfo
### Keywords: utilities

### ** Examples


#An example for the Global Forecast System 0.5 degree model

#Get some information about the latest model url and date, real time server
abbrev <- "gfs_0p50"
## Not run: 
##D urls.out <- GetDODSDates(abbrev)
##D model.url <- tail(urls.out$url, 1)
##D model.runs <- GetDODSModelRuns(model.url)
##D model.info <- GetDODSModelRunInfo(model.url, tail(model.runs$model.run, 1))
##D print(model.info)
## End(Not run)



