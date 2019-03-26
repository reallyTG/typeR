library(rsMove)


### Name: tMoveRes
### Title: tMoveRes
### Aliases: tMoveRes

### ** Examples

{

 require(raster)

 # reference data
 data(longMove)

 # test function for intervals of 1, 8 and 16 days (e.g. of MODIS data)
 obs.date <- as.Date(longMove@data$timestamp)
 a.res <- tMoveRes(longMove, obs.date, c(1,8,16), 0.01)

}



