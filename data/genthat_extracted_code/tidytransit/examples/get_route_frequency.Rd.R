library(tidytransit)


### Name: get_route_frequency
### Title: Get Route Frequency
### Aliases: get_route_frequency

### ** Examples

data(gtfs_obj)
gtfs_obj <- get_route_frequency(gtfs_obj)
x <- order(gtfs_obj$routes_frequency$median_headways)
head(gtfs_obj$routes_frequency[x,])



