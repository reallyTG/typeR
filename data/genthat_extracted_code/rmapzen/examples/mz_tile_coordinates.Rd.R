library(rmapzen)


### Name: mz_tile_coordinates
### Title: Specify tile coordinates
### Aliases: mz_tile_coordinates as.mz_tile_coordinates
###   as.mz_tile_coordinates.mz_tile_coordinates
###   as.mz_tile_coordinates.mz_bbox as.mz_tile_coordinates.mz_location
###   as.mz_tile_coordinates.mz_geocode_result

### ** Examples

mz_tile_coordinates(19293, 24641, 16)

## can specify multiple contiguous tiles:
mz_tile_coordinates(19293:19294, 24641:24642, 16)

## a rectangular bounding box can be converted to tile coordinates:
as.mz_tile_coordinates(mz_rect(min_lon = -122.2856,
                               min_lat = 37.73742,
                               max_lon = -122.1749,
                               max_lat = 37.84632))

## zoom level is calculated based on desired pixel dimensions of the map:
as.mz_tile_coordinates(mz_rect(min_lon = -122.2856,
                               min_lat = 37.73742,
                               max_lon = -122.1749,
                               max_lat = 37.84632), height = 750, width = 1000)

## a bounding box can also be calculated:
as.mz_tile_coordinates(mz_bbox(oakland_public))




