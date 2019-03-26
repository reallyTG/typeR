library(rNOMADS)


### Name: GribGrab
### Title: Download grib file from the NOMADS server.
### Aliases: GribGrab
### Keywords: connection

### ** Examples


#An example for the Global Forecast System 0.5 degree model

#Get the latest model url
## Not run: 
##D urls.out <- CrawlModels(abbrev = "gfs_0p50", depth = 1)
##D 
##D #Get a list of forecasts, variables and levels
##D model.parameters <- ParseModelPage(urls.out[1])
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
##D grib.info <- GribGrab(urls.out[1], my.pred, levels, variables)
##D 
##D #Extract the data
##D model.data <- ReadGrib(grib.info[[1]]$file.name, levels, variables)
##D 
##D #Reformat it
##D model.grid <- ModelGrid(model.data, c(0.5, 0.5))
##D 
##D #Show an image of world temperature at ground level
##D image(model.grid$z[2, 1,,])
## End(Not run)



