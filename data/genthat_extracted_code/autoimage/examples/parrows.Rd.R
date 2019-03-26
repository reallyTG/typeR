library(autoimage)


### Name: parrows
### Title: Projected arrows function
### Aliases: parrows

### ** Examples

data(narccap)
# plot image using bonne projection (w/o grid lines)
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 40, paxes.args = list(grid = FALSE))
# load some data for larger U.S. cities
data(us.cities, package = "maps")
cityxy <- list(x = us.cities$long[1:5], y = us.cities$lat[1:5])
parrows(cityxy$x[1:4], cityxy$y[1:4], cityxy$x[2:5], cityxy$y[2:5], 
        proj = "bonne", col = "orange")



