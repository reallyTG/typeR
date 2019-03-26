library(tidytransit)


### Name: import_gtfs
### Title: This function is deprecated. Please use read_gtfs
### Aliases: import_gtfs

### ** Examples

## No test: 
library(dplyr)
u1 <- "https://github.com/r-transit/tidytransit/raw/master/inst/extdata/sample-feed-fixed.zip"
sample_gtfs <- import_gtfs(u1)
attach(sample_gtfs)
#list routes by the number of stops they have
routes %>% inner_join(trips, by="route_id") %>%
  inner_join(stop_times) %>%
    inner_join(stops, by="stop_id") %>%
      group_by(route_long_name) %>%
        summarise(stop_count=n_distinct(stop_id)) %>%
          arrange(desc(stop_count))
## End(No test)



