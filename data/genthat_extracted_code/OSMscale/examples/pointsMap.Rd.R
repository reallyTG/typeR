library(OSMscale)


### Name: pointsMap
### Title: Get map for lat-long points
### Aliases: pointsMap
### Keywords: hplot spatial

### ** Examples

if(interactive()){
d <- read.table(sep=",", header=TRUE, text=
"lat, long # could e.g. be copied from googleMaps, rightclick on What's here?
43.221028, -123.382998
43.215348, -123.353804
43.227785, -123.368694
43.232649, -123.355895")

map <- pointsMap(lat, long, data=d)
map_utm <- pointsMap(lat, long, d, map=map, proj=putm(d$long))
axis(1); axis(2) # now in meters
projectPoints(d$lat, d$long)
scaleBar(map_utm, x=0.2, y=0.8, unit="mi", type="line", col="red", length=0.25)
pointsMap(lat, long, d[1:2,], map=map_utm, add=TRUE, col="red", pch=3, pargs=list(lwd=3))

d <- data.frame(long=c(12.95, 12.98, 13.22, 13.11), lat=c(52.40,52.52, 52.36, 52.45))
map <- pointsMap(lat,long,d, type="bing") # aerial map
}




