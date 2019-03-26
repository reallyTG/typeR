library(marmap)


### Name: get.depth
### Title: Get depth data by clicking on a map
### Aliases: get.depth

### ** Examples

# load NW Atlantic data and convert to class bathy
data(nw.atlantic)
atl <- as.bathy(nw.atlantic)

# create vectors of latitude and longitude
lon <- c(-70, -65, -63, -55)
lat <- c(33, 35, 40, 37)

# a simple example
plot(atl, lwd=.5)
points(lon,lat,pch=19,col=2)

# Use get.depth to get the depth for each point
get.depth(atl, x=lon, y=lat, locator=FALSE)

# alternativeley once the map is plotted, use the iteractive mode:
## Not run: 
##D get.depth(atl, locator=TRUE, pch=19, col=3)
## End(Not run)
# click several times and press Escape




