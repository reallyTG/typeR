library(rNOMADS)


### Name: GetDODSModelRuns
### Title: Find available model runs on the GrADS - DODS system.
### Aliases: GetDODSModelRuns
### Keywords: utilities

### ** Examples


#An example for the Global Forecast System 0.5 degree model

#Get the latest model url and date, real time server
abbrev <- "gfs_0p50"
## Not run: 
##D urls.out <- GetDODSDates(abbrev)
##D model.url <- tail(urls.out$url, 1)
##D model.runs <- GetDODSModelRuns(model.url)
##D print(paste("Latest model run", tail(model.runs$model.run.info, 1)))
## End(Not run)
#Get model dates from the GFS analysis archive
abbrev <- "gfsanl"
model.url <- NOMADSArchiveList("dods", abbrev = abbrev)$url
## Not run: 
##D model.runs <- GetDODSModelRuns(model.url)
##D print(model.runs$model.run.info)
## End(Not run)



