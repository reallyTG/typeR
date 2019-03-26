library(rNOMADS)


### Name: DODSGrab
### Title: Download model data from the NOMADS server using the GrADS-DODS
###   system.
### Aliases: DODSGrab
### Keywords: connection

### ** Examples


#An example for the Global Forecast System 0.5 degree model
#Make a world temperature map for the latest model run

## Not run: 
##D #Figure out which model is most recent
##D model.urls <- GetDODSDates("gfs_0p50")
##D latest.model <- tail(model.urls$url, 1)
##D model.runs <- GetDODSModelRuns(latest.model)
##D latest.model.run <- tail(model.runs$model.run, 1)
##D 
##D #Download worldwide temperature data at 2 m
##D variable <- "tmp2m"
##D time <- c(0, 0) #Analysis run, index starts at 0
##D lon <- c(0, 719) #All 720 longitude points
##D lat <- c(0, 360) #All 361 latitude points
##D model.data <- DODSGrab(latest.model, latest.model.run,
##D    variable, time, lon, lat)
##D 
##D #Make it into a nice array and plot it
##D model.grid <- ModelGrid(model.data, c(0.5, 0.5))
##D image(model.grid$z[1,1,,])
## End(Not run)



