library(autoimage)


### Name: ppoints
### Title: Projected points function
### Aliases: ppoints

### ** Examples

data(narccap)
# plot image using bonne projection (w/o grid lines)
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 40, paxes.args = list(grid = FALSE))
# get U.S. cities with population of about 40k or more
data(us.cities, package = "maps")
# add cities to existing plot
ppoints(us.cities$long, us.cities$lat, proj = "bonne")



