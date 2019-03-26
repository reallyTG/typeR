library(adklakedata)


### Name: adk_lake_shapes
### Title: Return path to Lake Polygons Shapefile
### Aliases: adk_lake_shapes

### ** Examples

library(sf)
bl = read_sf(adklakedata::adk_shape())
lakes = read_sf(adklakedata::adk_lake_shapes())
plot(st_geometry(bl))
plot(st_geometry(lakes), add=TRUE, col='blue')




