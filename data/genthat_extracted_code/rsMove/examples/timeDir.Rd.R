library(rsMove)


### Name: timeDir
### Title: timeDir
### Aliases: timeDir

### ** Examples

{

 require(raster)

 # read raster data
 file <- list.files(system.file('extdata', '', package="rsMove"), 'ndvi.tif', full.names=TRUE)
 r.stk <- stack(file)
 r.stk <- stack(r.stk, r.stk, r.stk) # dummy files for the example

 # read movement data
 data(shortMove)

 # raster dates
 r.dates <- seq.Date(as.Date("2013-08-01"), as.Date("2013-08-09"), 1)

 # sample dates
 obs.dates <- as.Date(shortMove@data$date)

 # perform directional sampling
 of <- function(x,y) {lm(y~x)$coefficients[2]}
 time.env <- timeDir(r.stk, r.dates, obs.dates, c(30,30), xy=shortMove, stat.fun=of)

}



