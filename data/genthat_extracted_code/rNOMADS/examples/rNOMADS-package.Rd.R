library(rNOMADS)


### Name: rNOMADS-package
### Title: An interface to the NOAA Operational Model Archive and
###   Distribution System
### Aliases: rNOMADS-package rNOMADS
### Keywords: package

### ** Examples

#Getting temperature for North Carolina, USA, 
#6-12 hours ago depending on when the latest model run was.
#Get values at the ground surface and at the 800 mb level
#Then make a contour plot of the surface temperature.
#We use GrADS-DODS here for compatibility.

#Using the Global Forecast System 0.5x0.5 model
## Not run: 
##D 
##D urls.out <- GetDODSDates(abbrev = "gfs_0p50")
##D model.url <- tail(urls.out$url, 1) #Get most recent model date
##D 
##D #Get most recent model run
##D 
##D model.runs <- GetDODSModelRuns(model.url)
##D model.run <- tail(model.runs$model.run, 1)
##D  
##D 
##D #Get ground temperature for the 6 hour prediction
##D variable <- "tmp2m" #temp at 2 m
##D time <- c(2,2) #6 hour prediction
##D lon.dom <- seq(0, 360, by = 0.5) #domain of longitudes in model
##D lat.dom <- seq(-90, 90, by = 0.5) #domain of latitudes in model
##D lon <- which((lon.dom >= 360 - 84) & (lon.dom <= 360 - 74)) - 1 #NOMADS indexes start at 0
##D lat <- which((lat.dom <= 37) & (lat.dom >= 32)) - 1 #NOMADS indexes start at 0 
##D model.data.surface <- DODSGrab(model.url, model.run, variable, time, c(min(lon), max(lon)), 
##D    c(min(lat), max(lat)))
##D 
##D lev <- c(8, 8) #800 mb level
##D variable <- "tmpprs"
##D model.data.800mb <- DODSGrab(model.url, model.run, variable, time, c(min(lon), max(lon)),
##D    c(min(lat), max(lat)), level = lev)
##D 
##D #Make results into arrays
##D model.array.surface <- ModelGrid(model.data.surface, c(0.5, 0.5))
##D model.array.800mb <- ModelGrid(model.data.800mb, c(0.5, 0.5))
##D 
##D #Make a contour plot of the temperature around North Carolina, USA:
##D contour(x = model.array.surface$x - 360, y = model.array.surface$y, 
##D     model.array.surface$z[1,1,,] - 273.15, xlab = "Longitude", ylab = "Latitude",
##D    main = paste("North Carolina Surface Temperatures for", 
##D    model.array.surface$fcst.date, "UTC in Celsius"))
##D 
##D dev.new()
##D contour(x = model.array.800mb$x - 360, y = model.array.800mb$y,
##D     model.array.800mb$z[1,1,,] - 273.15, xlab = "Longitude", ylab = "Latitude",
##D    main = paste("North Carolina Temperatures at 800 mb for",
##D    model.array.surface$fcst.date, "UTC in Celsius"))
## End(Not run)



