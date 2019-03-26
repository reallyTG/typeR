library(ramps)


### Name: simJSS
### Title: Dataset of Simulated Measurements from JSS Publication
### Aliases: simJSS simIowa simGrid
### Keywords: datasets

### ** Examples

data(simJSS)

## Map areal and point-source measurements
y <- simIowa$y[simIowa$areal == 1]
level <- (max(y) - y) / diff(range(y))
map("county", "iowa", fill = TRUE, col = gray(level))
title("Simulated Iowa Measurements")
points(simIowa$lon, simIowa$lat)

## Map grid sites
map("county", "iowa")
title("Regular Grid of Coordinates")
points(simGrid$lon, simGrid$lat)



