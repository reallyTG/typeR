## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)
library(tidytransit)

## ------------------------------------------------------------------------
# Read in GTFS feed
# here we use a feed included in the package, but note that you can read directly from the New York City Metropolitan Transit Authority using the following URL:
# nyc <- read_gtfs("http://web.mta.info/developers/data/nyct/subway/google_transit.zip")
local_gtfs_path <- system.file("extdata", 
                               "google_transit_nyc_subway.zip", 
                               package = "tidytransit")
nyc <- read_gtfs(local_gtfs_path, 
                 local=TRUE,
                 geometry=TRUE,
                 frequency=TRUE)

## ------------------------------------------------------------------------
routes_df_frequencies <- nyc$routes %>% 
  inner_join(nyc$routes_frequency, by = "route_id") %>% 
          select(route_long_name,
                 median_headways, 
                 mean_headways, 
                 st_dev_headways, 
                 stop_count)
head(routes_df_frequencies)

## ------------------------------------------------------------------------
routes_sf_frequencies <- nyc$routes_sf %>% 
      inner_join(nyc$routes_frequency, by = "route_id") %>% 
          select(median_headways, 
                 mean_headways, 
                 st_dev_headways, 
                 stop_count)

## ------------------------------------------------------------------------
head(sample_n(nyc$calendar,10))

## ------------------------------------------------------------------------
select_service_id <- filter(nyc$calendar, monday==1) %>% pull(service_id)
select_route_id <- filter(nyc$routes,route_id=="C")

## ------------------------------------------------------------------------
some_trips <- nyc$trips %>%
  filter(route_id %in% select_route_id & 
           service_id %in% select_service_id)

some_stop_times <- nyc$stop_times %>% 
  filter(trip_id %in% some_trips$trip_id) 

some_stops <- nyc$stops_sf %>%
  filter(stop_id %in% some_stop_times$stop_id)

## ------------------------------------------------------------------------
some_stops_freq_sf <- some_stops %>%
  left_join(nyc$stops_frequency, by="stop_id") %>%
  select(headway)
plot(some_stops_freq_sf)

## ------------------------------------------------------------------------
some_stops_freq_sf <- some_stops %>%
  left_join(nyc$stops_frequency, by="stop_id") %>%
  select(headway) %>%
  filter(headway<100)
plot(some_stops_freq_sf)

