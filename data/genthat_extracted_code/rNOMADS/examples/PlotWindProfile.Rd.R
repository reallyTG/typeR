library(rNOMADS)


### Name: PlotWindProfile
### Title: Plot wind speed and direction
### Aliases: PlotWindProfile
### Keywords: hplot

### ** Examples


## Not run: 
##D download.file("http://www.unc.edu/~haksaeng/rNOMADS/myTA.RDATA", 
##D    destfile = "myTA.RDATA")
##D load("myTA.RDATA")
##D #Find the latest Global Forecast System model run
##D model.urls <- GetDODSDates("gfs_0p50")
##D latest.model <- tail(model.urls$url, 1)
##D model.runs <- GetDODSModelRuns(latest.model)
##D latest.model.run <- tail(model.runs$model.run, 1)
##D 
##D #Get model nodes
##D 
##D lons <- seq(0, 359.5, by = 0.5)
##D lats <- seq(-90, 90, by = 0.5)
##D lon.ind <- which(lons <= (max(myTA$lon + 360) + 1) & lons >= (min(myTA$lon + 360) - 1))
##D lat.ind <- which(lats <= (max(myTA$lat) + 1) & lats >= (min(myTA$lat) - 1))
##D levels <- c(0, 46)
##D time <- c(0, 0)
##D 
##D #Get data 
##D variables <- c("hgtprs", "ugrdprs", "vgrdprs")
##D model.data <- DODSGrab(latest.model, latest.model.run,
##D    variables, time, c(min(lon.ind), max(lon.ind)), 
##D    c(min(lat.ind), max(lat.ind)), levels)
##D 
##D #Build profiles
##D profile <- BuildProfile(model.data, myTA$lon + 360, myTA$lat, 
##D     spatial.average = FALSE)
##D 
##D #Build profiles
##D zonal.wind      <- NULL
##D meridional.wind <- NULL 
##D height          <- NULL
##D 
##D for(k in 1:length(profile)) {
##D    hgt  <- profile[[k]]$profile.data[, which(profile[[k]]$variables == "hgtprs"),]
##D    ugrd <- profile[[k]]$profile.data[, which(profile[[k]]$variables == "ugrdprs"),]
##D    vgrd <- profile[[k]]$profile.data[, which(profile[[k]]$variables == "vgrdprs"),]
##D 
##D    synth.hgt <- seq(min(hgt),
##D        max(hgt), length.out = 1000)
##D    ugrd.spline <- splinefun(hgt, ugrd, method = "natural")
##D    vgrd.spline <- splinefun(hgt, vgrd, method = "natural")
##D    zonal.wind[[k]] <- ugrd.spline(synth.hgt)
##D    meridional.wind[[k]] <- vgrd.spline(synth.hgt)
##D    height[[k]] <- synth.hgt
##D }
##D 
##D #Plot them all
##D PlotWindProfile(zonal.wind, meridional.wind, height, lines = TRUE, 
##D     points = FALSE, elev.circles = c(0, 25000, 50000), elev.labels = c(0, 25, 50), 
##D     radial.lines = seq(45, 360, by = 45), colorbar = TRUE, invert = FALSE, 
##D     point.cex = 2, pch = 19, lty = 1, lwd = 1, 
##D     height.range = c(0, 50000), colorbar.label = "Wind Speed (m/s)")
## End(Not run)



