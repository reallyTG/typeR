library(meteoForecast)


### Encoding: UTF-8

### Name: getRaster
### Title: NWP forecasts for a region
### Aliases: getRaster getRasterDays getRasterDay checkDays
### Keywords: raster spatial

### ** Examples

## Not run: 
##D today <- Sys.Date()
##D testDay <- today - 7
##D 
##D ## Retrieve raster data
##D wrf <- getRaster('temp', day = testDay)
##D 
##D ## Display results with rasterVis
##D library(rasterVis)
##D 
##D levelplot(wrf, layers = 10:19)
##D 
##D hovmoller(wrf)
##D 
##D ## Using box and frames specification
##D mfExtent('gfs')
##D cloudGFS <- getRaster('Temperature_surface',
##D                       day = testDay,
##D                       box = c(-10, 10, -10, 10),
##D                       service = 'gfs')
##D 
##D mfExtent('nam')
##D cloudNAM <- getRaster('Temperature_surface',
##D                       day = testDay,
##D                       box = c(-100, -80, 30, 50),
##D                       frames = 10,
##D                       service = 'nam')
##D mfExtent('rap')
##D cloudRAP <- getRaster('Temperature_surface',
##D                       day = testDay,
##D                       box = c(-100, -80, 30, 50),
##D                       frames = 10,
##D                       service = 'rap')
##D 
##D 
##D ## Day sequence of cloud cover
##D wrfDays <- getRasterDays('cft',
##D                          start = testDay - 3,
##D                          end = testDay + 2,
##D                          box = c(-2, 35, 2, 40))
##D 
##D levelplot(wrfDays, layers = 10:19)
##D 
##D ## animation
##D levelplot(wrfDays, layout = c(1, 1), par.settings = BTCTheme)
##D 
##D ## Hövmoller graphic
##D hovmoller(wrfDays, par.settings = BTCTheme, contour = TRUE, cuts = 10)
##D 
##D NAMDays <- getRasterDays('Temperature_surface',
##D                          start = testDay - 3,
##D                          end = testDay + 2,
##D                          box = c(-100, -80, 30, 50),
##D                          service = 'nam')
##D 
##D ## Extract data at some locations
##D 
##D st <- data.frame(name=c('Almeria','Granada','Huelva','Malaga','Caceres'),
##D                elev=c(42, 702, 38, 29, 448))
##D 
##D coordinates(st) <- cbind(c(-2.46, -3.60, -6.94, -4.42, -6.37),
##D                          c(36.84, 37.18, 37.26, 36.63, 39.47)
##D                          )
##D proj4string(st) <- '+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0'
##D 
##D 
##D ## Extract values for some locations
##D vals <- extract(wrf, st)
##D vals <- zoo(t(vals), getZ(wrf))
##D names(vals) <- st$name
##D 
##D xyplot(vals)
## End(Not run)



