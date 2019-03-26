library(pointdexter)


### Name: community_areas_spdf
### Title: A SpatialPolygonsDataFrame of Chicago's 77 community areas
### Aliases: community_areas_spdf
### Keywords: datasets

### ** Examples

# load necessary packages ----
library(sp)

# load necessary data ----
data("community_areas_spdf")

# plot all 77 community areas -----
par(mar = c(0, 0, 1, 0))

plot(community_areas_spdf
     , main = "Chicago's 77 community areas"
     , col = "gray85"
     , border = "dodgerblue4")



