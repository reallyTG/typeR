library(rNOMADS)


### Name: GetClosestForecasts
### Title: Get the forecast time closest to a given date for a given model
### Aliases: GetClosestForecasts
### Keywords: chron

### ** Examples


#Get the exact temperature profile of Chapel Hill, NC
#by performing a weighted average of GFS model forecasts.

#Figure out which forecasts to use
forecast.date <- as.POSIXlt(Sys.time(), tz = "UTC")
abbrev <- "gfs_0p50"

## Not run: 
##D forecasts <- GetClosestForecasts(abbrev = abbrev, forecast.date)
## End(Not run)

#Get levels
pressure <- c(1, 2, 3, 5, 7,
10, 20, 30, 50, 70,
seq(100, 1000, by = 25))
levels <- paste(pressure, " mb", sep = "")

#Variables - temperature and height only
variables <- c("TMP", "HGT")

#Location
lon <- c(-79.052083)
lat <- c(35.907492)
model.domain <- c(lon - 1, lon + 1, lat + 1, lat - 1)

## Not run: 
##D #Get the data for each
##D grb.info <- GribGrab(forecasts$model.url, 
##D    c(forecasts$fore.forecast, forecasts$back.forecast), levels, variables, 
##D    model.domain = model.domain)
##D 
##D fore.data <- ReadGrib(grb.info[[1]]$file.name, levels, variables) 
##D back.data <- ReadGrib(grb.info[[2]]$file.name, levels, variables)
##D 
##D back.profile <- BuildProfile(back.data, lon, lat,
##D    spatial.average = TRUE, points = 8)
##D 
##D fore.profile <- BuildProfile(fore.data, lon, lat,
##D    spatial.average = TRUE, points = 8)
##D 
##D temps <- cbind(back.profile[[1]]$profile.data[, which(back.profile[[1]]$variables == "TMP"),],
##D     fore.profile[[1]]$profile.data[, which(fore.profile[[1]]$variables == "TMP"),])
##D  
##D heights <-  cbind(back.profile[[1]]$profile.data[, which(back.profile[[1]]$variables == "HGT"),],
##D     fore.profile[[1]]$profile.data[, which(fore.profile[[1]]$variables == "HGT"),])
##D 
##D 
##D time.gap <- forecasts$fore.hr - forecasts$back.hr
##D exact.temp <- (temps[,1] * abs(forecasts$fore.hr) + temps[,2] * abs(forecasts$back.hr))/time.gap
##D exact.hgt <- (heights[,1] * abs(forecasts$fore.hr) + heights[,2] * abs(forecasts$back.hr))/time.gap
##D 
##D #Plot results
##D plot(c(min(temps), max(temps)), c(min(heights), max(heights)), type = "n",
##D     xlab = "Temperature (C)", ylab = "Height (m)")
##D points(temps[,1], heights[,1], pch = 1, col = 1)
##D points(temps[,2], heights[,2], pch = 2, col = 2)
##D points(exact.temp, exact.hgt, col = 3, lty = 2, pch = 3)
##D legend("topleft", pch = c(1, 2, 3), col = c(1, 2, 3),
##D    legend = c(forecasts$back.forecast, forecasts$fore.forecast, as.character(Sys.time())))
## End(Not run)



