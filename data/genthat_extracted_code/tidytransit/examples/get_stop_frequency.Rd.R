library(tidytransit)


### Name: get_stop_frequency
### Title: Get Stop Frequency
### Aliases: get_stop_frequency

### ** Examples

data(gtfs_obj)
gtfs_obj <- get_stop_frequency(gtfs_obj)
x <- order(gtfs_obj$stops_frequency$headway)
head(gtfs_obj$stops_frequency_df[x,])



