library(marinespeed)


### Name: geographic_filter
### Title: Filter points based on distance to other points
### Aliases: geographic_filter

### ** Examples

set.seed(42)
data <- cbind(runif(10, -180, 180), runif(10, -90, 90))
filter_data <- cbind(runif(10, -180, 180), runif(10, -90, 90))
# remove points from data data are within a 1000km buffer around
# the points in filter_data
filtered <- geographic_filter(data, filter_data, buffer_distance = 1000*1000,
                              lonlat = TRUE)

data_filtered <- data[filtered,]
data_removed <- data[-filtered,]




