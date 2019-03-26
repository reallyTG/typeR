library(tidytransit)


### Name: stops_df_as_sf
### Title: This function is deprecated. Please use get_stop_geometry Make
###   Stops into Simple Features Points
### Aliases: stops_df_as_sf

### ** Examples

data(gtfs_obj)
some_stops <- gtfs_obj$stops[sample(nrow(gtfs_obj$stops), 40),]
some_stops_sf <- get_stop_geometry(some_stops)
plot(some_stops_sf)



