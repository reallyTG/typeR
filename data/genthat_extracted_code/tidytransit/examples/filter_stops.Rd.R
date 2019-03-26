library(tidytransit)


### Name: filter_stops
### Title: Get a set of stops for a given set of service ids and route ids
### Aliases: filter_stops

### ** Examples

## No test: 
local_gtfs_path <- system.file("extdata", "google_transit_nyc_subway.zip", package = "tidytransit")
nyc <- read_gtfs(local_gtfs_path,local=TRUE)
select_service_id <- filter(nyc$calendar, monday==1) %>% pull(service_id)
select_route_id <- sample_n(nyc$routes, 1) %>% pull(route_id)
filtered_stops_df <- filter_stops(nyc, select_service_id, select_route_id)
## End(No test)



