library(tidytransit)


### Name: get_stop_geometry
### Title: Make Stops into Simple Features Points
### Aliases: get_stop_geometry

### ** Examples

data(gtfs_obj)
some_stops <- gtfs_obj$stops[sample(nrow(gtfs_obj$stops), 40),]
some_stops_sf <- get_stop_geometry(some_stops)
plot(some_stops_sf)



