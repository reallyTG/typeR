library(adklakedata)


### Name: adk_shape
### Title: Return path to Adirondack Park Shapefile
### Aliases: adk_shape

### ** Examples

library(sf)
bl = read_sf(adklakedata::adk_shape())
lakes = read_sf(adklakedata::adk_lake_shapes())
plot(st_geometry(bl))
plot(st_geometry(lakes), add=TRUE, col='blue')





