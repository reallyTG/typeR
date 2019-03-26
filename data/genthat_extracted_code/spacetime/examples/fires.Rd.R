library(spacetime)


### Name: fires
### Title: Northern Los Angeles County Fires
### Aliases: fires
### Keywords: datasets

### ** Examples

data(fires)
fires$X <- fires$X*100000
fires$Y <- fires$Y*100000
library(sp)
coordinates(fires) <- c("X", "Y")
proj4string(fires) <- CRS("+init=epsg:2229 +ellps=GRS80")
dates <- as.Date("1960-01-01")+(fires$Time-1)
Fires <- STIDF(as(fires, "SpatialPoints"), dates, data.frame(time=fires$Time))
if (require(rgdal)) {
  library(maptools)
  library(mapdata)
  m <- map("county", "california", xlim=c(-119.1, -117.5), 
  	ylim=c(33.7, 35.0), plot=FALSE)
  cc <- spTransform(map2SpatialLines(m, 
  	proj4string=CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84")), 
	CRS("+init=epsg:2229 +ellps=GRS80"))
  plot(cc, xlim=c(6300000, 6670000), ylim=c(1740000, 2120000))
  plot(slot(Fires, "sp"), pch=3, add=TRUE)
  stplot(Fires, sp.layout=list("sp.lines", cc))
}



