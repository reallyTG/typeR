library(GEOmap)


### Name: getgreatarc
### Title: Great Circle Arc
### Aliases: getgreatarc
### Keywords: misc

### ** Examples

PARIS = c(48.8666666666667, 2.33333333333333)
RIODEJANEIRO =c( -22.9,  -43.2333333333333)

g = getgreatarc(PARIS[1],PARIS[2], RIODEJANEIRO[1], RIODEJANEIRO[2],
100)
library(geomapdata)
data(worldmap)

plotGEOmap(worldmap, add=FALSE, shiftlon=180)

lines(g$lon+180, g$lat)




