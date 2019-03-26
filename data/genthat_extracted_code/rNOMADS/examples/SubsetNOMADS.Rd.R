library(rNOMADS)


### Name: SubsetNOMADS
### Title: Subset model data output
### Aliases: SubsetNOMADS
### Keywords: manip

### ** Examples


## Not run: 
##D #Plot winds from 20 GENS model runs
##D 
##D #Get the latest ensemble model run
##D model.urls <- GetDODSDates("gens")
##D latest.model <- tail(model.urls$url, 1)
##D model.runs <- GetDODSModelRuns(latest.model)
##D model.run <- tail(model.runs$model.run[grepl("all", 
##D     model.runs$model.run)], 1)
##D 
##D #Define region of interest: Chapel Hill, NC
##D lon <- -79.052104
##D lat <- 35.907553
##D 
##D lons <- seq(0, 359, by = 1)
##D lats <- seq(-90, 90, by = 1)
##D 
##D lon.diff <- abs(lon + 360 - lons)
##D lat.diff <- abs(lat - lats)
##D 
##D model.lon.ind <- which(lon.diff == min(lon.diff)) - 1
##D model.lat.ind <- which(lat.diff == min(lat.diff)) - 1
##D 
##D #Set up call to NOMADS
##D time <- c(0, 0)      #Analysis(?) model only
##D node.lon  <- c(model.lon.ind - 2, model.lon.ind + 2)  #Longitude grid
##D node.lat  <- c(model.lat.ind - 2, model.lat.ind + 2)   #Latitude grid
##D variables <- c("ugrdprs", "vgrdprs", "hgtprs") #Wind speeds, and geopotential height
##D levels    <- c(0, 25) #All available levels
##D ensembles <- c(0, 20)  #All available ensembles
##D 
##D model.data <- DODSGrab(latest.model, model.run, variables, time, 
##D     node.lon, node.lat, levels = levels, ensembles = ensembles)
##D 
##D #Plot winds
##D zonal.wind <- NULL
##D merid.wind <- NULL
##D height     <- NULL
##D 
##D for(k in ((ensembles[1]:ensembles[2] + 1))) {
##D     model.data.sub <- SubsetNOMADS(model.data, ensembles = c(k), 
##D     variables = c("hgtprs", "ugrdprs", "vgrdprs"))
##D     profile <- BuildProfile(model.data.sub, lon + 360, lat)
##D     hgt     <- profile[[1]]$profile.data[, which(profile[[1]]$variables == "hgtprs"),]
##D     ugrd    <- profile[[1]]$profile.data[, which(profile[[1]]$variables == "ugrdprs"),]
##D     vgrd    <- profile[[1]]$profile.data[, which(profile[[1]]$variables == "vgrdprs"),]
##D 
##D    synth.hgt <- seq(min(hgt),
##D        max(hgt), length.out = 1000)
##D    ugrd.spline <- splinefun(hgt, ugrd, method = "natural")
##D    vgrd.spline <- splinefun(hgt, vgrd, method = "natural")
##D    zonal.wind[[k]] <- ugrd.spline(synth.hgt)
##D    merid.wind[[k]] <- vgrd.spline(synth.hgt)
##D    height[[k]] <- synth.hgt
##D }
##D 
##D PlotWindProfile(zonal.wind, merid.wind, height, lines = TRUE,
##D     points = FALSE, elev.circles = c(0, 15000, 30000), elev.labels = c(0, 15, 30),
##D     radial.lines = seq(45, 360, by = 45), colorbar = TRUE, invert = FALSE,
##D     point.cex = 2, pch = 19, lty = 1, lwd = 1,
##D     height.range = c(0, 30000), colorbar.label = "Wind Speed (m/s)")
## End(Not run)



