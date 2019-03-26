library(autoimage)


### Name: ppolygon
### Title: Projected polygon function
### Aliases: ppolygon

### ** Examples

data(narccap)
# plot image using bonne projection (w/o grid lines)
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 40, paxes.args = list(col = "grey"))
# filled polygon for Colorado border
data(copoly)
ppolygon(copoly, proj = "bonne", col = "orange")



