library(lawn)


### Name: lawn_getcoord
### Title: Unwrap a coordinate from a Feature with a Point geometry, or a
###   single coordinate.
### Aliases: lawn_getcoord

### ** Examples

x <- "{ type: 'Point', coordinates: [10, 50] }"
lawn_getcoord(x)

library(jsonlite)
x <- fromJSON(lawn_data$points_count, FALSE)$features
lawn_getcoord(x[[1]])
lawn_getcoord(x[[2]])
lawn_getcoord(x[[1]]$geometry)
lawn_getcoord(x[[1]]$geometry$coordinates)

# fails
# lawn_getcoord(x[[1]]$geometry$coordinates[[1]])



