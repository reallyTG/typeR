library(rNOMADS)


### Name: GribInfo
### Title: Get grib file inventory.
### Aliases: GribInfo
### Keywords: utilities

### ** Examples


## Not run: 
##D #An example for the Global Forecast System 0.5 degree model
##D 
##D #Get the second latest model url, for stability
##D urls.out <- CrawlModels(abbrev = "gfs_0p50", depth = 2)
##D 
##D #Get a list of forecasts, variables and levels
##D model.parameters <- ParseModelPage(urls.out[2])
##D 
##D #Figure out which one is the 6 hour forecast
##D #provided by the latest model run
##D #(will be the forecast from 6-12 hours from the current date) 
##D 
##D my.pred <- model.parameters$pred[grep("06$", model.parameters$pred)]
##D 
##D #What region of the atmosphere to get data for
##D levels <- c("2 m above ground", "800 mb")
##D 
##D #What data to return
##D variables <- c("TMP", "RH") #Temperature and relative humidity
##D 
##D #Get the data
##D grib.info <- GribGrab(urls.out[2], my.pred, levels, variables)
##D 
##D #Print out the inventory - it should match the requested data
##D grib.inv <- GribInfo(grib.info[[1]]$file.name, "grib2")
## End(Not run)



