library(mapplots)


### Name: basemap
### Title: Draw a (blank) map
### Aliases: basemap

### ** Examples

data(landings)
data(coast)
xlim <- c(-11,-5.5)
ylim <- c(51.5,55.5)
basemap(xlim, ylim)
draw.shape(coast, col="cornsilk")



