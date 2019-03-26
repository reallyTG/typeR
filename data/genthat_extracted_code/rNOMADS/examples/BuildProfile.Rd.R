library(rNOMADS)


### Name: BuildProfile
### Title: Get model data at a specific point.
### Aliases: BuildProfile
### Keywords: manip

### ** Examples


#Get temperature profile in Chapel Hill, NC.

#First, define each location
lon <- -79.052094
lat <- 35.907562

#Get second to latest GFS 0.5 model, use analysis forecast
#(this ensures the data's fully up on NOMADS)

## Not run: 
##D model.url <- CrawlModels(abbrev = "gfs_0p50", depth = 2)[2]
##D pred <- ParseModelPage(model.url)$pred[1]
## End(Not run)

#Get levels
pressure <- c(1, 2, 3, 5, 7,
10, 20, 30, 50, 70,
seq(100, 1000, by = 25))
levels <- paste(pressure, " mb", sep = "")

#Variables - temperature and height only
variables <- c("TMP", "HGT")

## Not run: 
##D grib.info <- GribGrab(model.url, pred, levels, variables,
##D    model.domain = c(-85, -75, 37, 32))
##D grib.data <- ReadGrib(grib.info[[1]]$file.name, levels, variables)
##D 
##D profile <- BuildProfile(grib.data, lon, lat, TRUE, points = 8)
##D plot(profile[[1]]$profile.data[,2, 1] - 272.15, 
##D    profile[[1]]$profile.data[,1, 1], xlab = "Temperature (C)",
##D    ylab = "Height (m)", main = "Temperature Profile above Chapel Hill, NC")
## End(Not run)



