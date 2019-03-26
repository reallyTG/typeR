library(trread)


### Name: import_gtfs
### Title: Get and validate dataframes of General Transit Feed
###   Specification (GTFS) data.
### Aliases: import_gtfs

### ** Examples

## No test: 
library(dplyr)
u1 <- "https://developers.google.com/transit/gtfs/examples/sample-feed.zip"
sample_gtfs <- import_gtfs(u1)
attach(sample_gtfs)
#list routes by the number of stops they have
routes_df %>% inner_join(trips_df, by="route_id") %>%
  inner_join(stop_times_df) %>% 
    inner_join(stops_df, by="stop_id") %>% 
      group_by(route_long_name) %>%
        summarise(stop_count=n_distinct(stop_id)) %>%
          arrange(desc(stop_count))
## End(No test)



