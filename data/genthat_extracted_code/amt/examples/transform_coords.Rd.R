library(amt)


### Name: transform_coords
### Title: Transform CRS
### Aliases: transform_coords transform_coords.track_xy transform_crs

### ** Examples

data(deer)
get_crs(deer)

# project to geographical coordinates (note the CRS is taken automatically from the object deer).
d1 <- transform_coords(deer, sp::CRS("+init=epsg:4326"))



