library(autoimage)


### Name: ptext
### Title: Projected text function
### Aliases: ptext

### ** Examples

data(narccap)
# plot image using bonne projection (w/o grid lines)
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 40, paxes.args = list(grid = FALSE))
# get national boundaries
data(worldMapEnv, package = "maps")
worldpoly <- maps::map("world", plot = FALSE)
plines(worldpoly, proj = "bonne")
# add U.S. city names to existing plot
data(us.cities, package = "maps")
citysmall <- head(us.cities)
ptext(x = citysmall$lon, y = citysmall$lat, 
      labels = citysmall$name, proj = "bonne")



