library(SpatialEpi)


### Name: latlong2grid
### Title: Convert Coordinates from Latitude/Longitude to Grid
### Aliases: latlong2grid
### Keywords: file

### ** Examples

## Convert coordinates
coord <- data.frame(rbind(
# Montreal, QC:  Latitude: 45deg 28' 0" N (deg min sec), Longitude: 73deg 45' 0" W
c(-73.7500, 45.4667),
# Vancouver, BC:  Latitude: 45deg 39' 38" N (deg min sec), Longitude: 122deg 36' 15" W
c(-122.6042, 45.6605)
))
latlong2grid(coord)

## Convert SpatialPolygon
data(pennLC)
new <- latlong2grid(pennLC$spatial.polygon)
par(mfrow=c(1,2))
plot(pennLC$spatial.polygon,axes=TRUE)
title("Lat/Long")
plot(new,axes=TRUE)
title("Grid (in km)")



