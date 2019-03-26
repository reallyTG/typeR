library(rNOMADS)


### Name: ArchiveGribGrab
### Title: Download archived model data from the NOMADS server.
### Aliases: ArchiveGribGrab
### Keywords: connection

### ** Examples

#An example for the Global Forecast System
#Get data for January 1 2014
#Temperature at 2 m above ground
#3 hour prediction
# using GRIB

abbrev <- "gfsanl"
model.date <- 20140101
model.run <- 06
preds <- 3

## Not run: 
##D model.info <- ArchiveGribGrab(abbrev, model.date, 
##D     model.run, preds, file.type = "grib2")
##D model.data <- ReadGrib(model.info[[1]]$file.name, c("2 m above ground"), c("TMP"))
##D 
##D #Get surface temperature in Chapel Hill, NC
##D lat <- 35.907605
##D lon <- -79.052147
##D 
##D profile <- BuildProfile(model.data, lon, lat, TRUE)
##D print(paste0("The temperature prediction in Chapel Hill was ", 
##D     sprintf("%.0f", profile[[1]]$profile.data[1,1,1] - 272.15), " degrees Celsius."))
## End(Not run)



