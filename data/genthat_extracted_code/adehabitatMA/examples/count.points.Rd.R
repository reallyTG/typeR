library(adehabitatMA)


### Name: count.points
### Title: Number of Points in Each Pixel of a Raster Map
### Aliases: count.points
### Keywords: spatial

### ** Examples


data(lynxjura)

# locs is the SpatialPointsDataFrame containing the
# locations of presence indices of Lynx in the Jura mountains (France)
locs <- lynxjura$locs
head(locs)

# sa is the SpatialPixelsDataFrame object containing
# maps of the study area
sa <- lynxjura$map

# Count all points
cp <- count.points(locs, sa)
cp
image(cp)

# count the points per type of lynx presence indices:
cp <- count.points(locs[,2], sa)
cp





