library(rsMove)


### Name: spaceDir
### Title: spaceDir
### Aliases: spaceDir

### ** Examples

{

 require(raster)

 # read raster data
 r <- raster(system.file('extdata', '2013-07-16_ndvi.tif', package="rsMove"))

 # read movement data
 data(shortMove)

 # observation time
 obs.time <- strptime(paste0(shortMove@data$date, ' ',shortMove@data$time),
 format="%Y/%m/%d %H:%M:%S")

 # perform directional sampling
 of <- function(i) {lm(i~c(1:length(i)))$coefficients[2]}
 s.sample <- spaceDir(shortMove, r, "backward", "cont", obs.time=obs.time, stat.fun=of)

}



