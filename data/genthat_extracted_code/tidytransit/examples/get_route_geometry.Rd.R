library(tidytransit)


### Name: get_route_geometry
### Title: Make Routes into Simple Features Lines
### Aliases: get_route_geometry

### ** Examples

data(gtfs_obj)
routes_sf <- get_route_geometry(gtfs_obj)
plot(routes_sf[1,])



