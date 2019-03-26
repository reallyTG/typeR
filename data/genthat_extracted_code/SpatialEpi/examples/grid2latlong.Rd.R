library(SpatialEpi)


### Name: grid2latlong
### Title: Convert Coordinates from Grid to Latitude/Longitude
### Aliases: grid2latlong
### Keywords: internal

### ** Examples

coord <- data.frame(rbind(
# Montreal, QC
c(-6414.30, 5052.849),
# Vancouver, BC
c(-122.6042, 45.6605)
))

grid2latlong(coord)



