library(pointdexter)


### Name: city_boundary_spdf
### Title: A SpatialPolygonsDataFrame of the city boundary of Chicago
### Aliases: city_boundary_spdf
### Keywords: datasets

### ** Examples

# load necessary packages ----
library(sp)

# load necessary data ----
data("city_boundary_spdf")

# plot Chicago ----
par(mar = c(0, 0, 1, 0))

plot(city_boundary_spdf
     , main = "City of Chicago boundary"
     , col = "gray85"
     , border = "dodgerblue4")



