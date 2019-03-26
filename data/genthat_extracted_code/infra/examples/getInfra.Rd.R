library(infra)


### Name: getInfra
### Title: An Infrastructure Proxy Function
### Aliases: getInfra
### Keywords: bing google infrastructure maps openstreetmap

### ** Examples

# In this example, we'll build a very low resolution (two degrees per grid cell) grid of Japan,
# retrieve the map values from Bing at zoom level 14, and render a simple map.

# First, define the latitude and longitude bounds of Japan and create a data frame.
# (This uses a very restricted version of the territory of Japan for the sake of speed.)

lats <- rep(rev(seq(32,44, by=2)), each=7)
lngs <- rep(seq(130,142, by=2), 7)

coords <- data.frame(lats,lngs)

infraBing <- getInfra(dataFrame = coords, zoom=14, server="bing")

# Now that we have the values in the newly-created infraBing
# variable we can plot them.  First, we need to define our colour
# gamut, running from 0 to the maximum map value retrieved.

grey <- gray(0:max(infraBing) / max(infraBing))

# Now we can plot.

png(filename="japanInfraBing.png", width=480, height=480, units="px")
plot(lngs, lats, col=grey[infraBing], pch=15, cex=14)
dev.off()



