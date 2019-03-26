library(tidytransit)


### Name: get_date_service_table
### Title: Returns all possible date/service_id combinations as a data
###   frame
### Aliases: get_date_service_table

### ** Examples

library(dplyr)
local_gtfs_path <- system.file("extdata", "google_transit_nyc_subway.zip", package = "tidytransit")
nyc <- read_gtfs(local_gtfs_path, local=TRUE)
nyc_services_by_date <- nyc %>% get_date_service_table()
# count the number of services running on each date
nyc_services_by_date %>% group_by(date) %>% count()




