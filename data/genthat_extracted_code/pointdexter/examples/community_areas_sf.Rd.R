library(pointdexter)


### Name: community_areas_sf
### Title: Chicago's 77 community areas
### Aliases: community_areas_sf
### Keywords: datasets

### ** Examples

## No test: 
# load necessary packages ----
library(sf)

# load necessary data ----
data("community_areas_sf")

# plot all 77 community areas -----
par(mar = c(0, 0, 1, 0))

plot(community_areas_sf$geometry
     , main = "Chicago's 77 community areas"
     , col = "gray85"
     , border = "dodgerblue4")
     
## End(No test)



