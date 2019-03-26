library(ggmap)


### Name: calc_zoom
### Title: Calculate a zoom given a bounding box
### Aliases: calc_zoom

### ** Examples

# From data
calc_zoom(lon, lat, wind)

# From range
lon_range <- extendrange( wind$lon )
lat_range <- extendrange( wind$lat )
calc_zoom(lon_range, lat_range)

# From bounding box
box <- make_bbox(lon, lat, data = crime)
calc_zoom(box)



