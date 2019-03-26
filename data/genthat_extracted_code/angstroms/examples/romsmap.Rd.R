library(angstroms)


### Name: romsmap
### Title: Remap an object to the ROMS grid.
### Aliases: romsmap romsmap.SpatialPolygonsDataFrame
###   romsmap.SpatialLinesDataFrame romsmap.SpatialPointsDataFrame

### ** Examples

ant_ice_coords <- romsmap(antarctica, ice_coords)
plot(ice_fake, main = "sea ice in pure grid space")
plot(ant_ice_coords, add = TRUE)





