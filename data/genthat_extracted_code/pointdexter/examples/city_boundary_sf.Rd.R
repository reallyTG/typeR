library(pointdexter)


### Name: city_boundary_sf
### Title: City boundary of Chicago
### Aliases: city_boundary_sf
### Keywords: datasets

### ** Examples

## No test: 
# load necessary packages ----
library(sf)

# load necessary data ----
data("city_boundary_sf")

# plot Chicago ----
par(mar = c(0, 0, 1, 0))

plot(city_boundary_sf$geometry
     , main = "City of Chicago boundary"
     , col = "gray85"
     , border = "dodgerblue4")
     
## End(No test)



