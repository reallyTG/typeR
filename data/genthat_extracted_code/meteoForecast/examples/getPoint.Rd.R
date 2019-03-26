library(meteoForecast)


### Name: getPoint
### Title: NWP forecasts for a location
### Aliases: getPoint getPointDays getPointRuns
### Keywords: spatial time series

### ** Examples

## Not run: 
##D   today <- Sys.Date()
##D   testDay <- today - 7
##D 
##D   ## temperature (Kelvin) forecast from meteogalicia
##D   tempK <- getPoint(c(0, 40), vars = 'temp', day = testDay)
##D   ## Cell does not coincide exactly with request
##D   attr(tempK, 'lat')
##D   attr(tempK, 'lon')
##D   ## Units conversion
##D   tempC <- tempK - 273
##D 
##D   library(lattice)
##D   ## Beware: the x-axis labels display time using your local timezone.
##D   Sys.timezone()
##D 
##D   ## Use Sys.setenv(TZ = 'UTC') to produce graphics with the timezone
##D   ## of the objects provided by meteoForecast.
##D   xyplot(tempC)
##D 
##D   ## Multiple variables
##D   vars <- getPoint(c(0, 40), vars = c('swflx', 'temp'), day = testDay)
##D   xyplot(vars)
##D 
##D   ## Vertical coordinates
##D   tempK1000 <- getPoint(c(101,6),
##D                         vars = "Temperature_surface",
##D                         day = testDay,
##D                         service ="gfs", vertical = 1000)
##D 
##D   ## Time sequence
##D   radDays <- getPointDays(c(0, 40),
##D                           start = testDay - 3,
##D                           end = testDay + 2)
##D   
##D   xyplot(radDays)
##D 
##D   ## Variability between runs
##D   radRuns <- getPointRuns(c(0, 40),
##D                           start = testDay - 3,
##D                           end = testDay + 2)
##D   xyplot(radRuns, superpose = TRUE)
##D   
##D   ## variability around the average
##D   radAv <- rowMeans(radRuns)
##D   radVar <- sweep(radRuns, 1, radAv)
##D   xyplot(radVar, superpose = TRUE)
## End(Not run)



