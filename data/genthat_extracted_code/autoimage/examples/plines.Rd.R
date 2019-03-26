library(autoimage)


### Name: plines
### Title: Projected lines function
### Aliases: plines

### ** Examples

data(narccap)
# plot image using bonne projection (w/o grid lines)
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 40, paxes.args = list(grid = FALSE))
# get national boundaries
data(worldMapEnv, package = "maps")
worldpoly <- maps::map("world", plot = FALSE)
# add boundaries to existing plot
plines(worldpoly, proj = "bonne")



