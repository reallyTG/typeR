library(geomerge)


### Name: generateGrid
### Title: Generates a grid in a given local CRS that is, by default,
###   returned as SpatialPolygonsDataFrame in WGS84.
### Aliases: generateGrid

### ** Examples

require(sp)
data(geomerge)

# Generate grid with 10 km cell size in local CRS for Nigeria
states.grid <- generateGrid(states,10000,local.CRS=CRS("+init=epsg:26391"),
                              silent=TRUE)



