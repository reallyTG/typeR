library(bfast)


### Name: bfastts
### Title: Create a regular time series object by combining data and date
###   information
### Aliases: bfastts
### Keywords: ts

### ** Examples


library("raster")
f <- system.file("extdata/modisraster.grd", package="bfast")
modisbrick <- brick(f)
ndvi <- bfastts(as.vector(modisbrick[1]), dates, type = c("16-day")) ## data of pixel 1
plot(ndvi/10000) 




