library(tidytransit)


### Name: routes_df_as_sf
### Title: This function is deprecated. Please use get_route_geometry Make
###   Routes into Simple Features Lines
### Aliases: routes_df_as_sf

### ** Examples

data(gtfs_obj)
routes_sf <- get_route_geometry(gtfs_obj)
plot(routes_sf[1,])



