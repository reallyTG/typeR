library(mapplots)


### Name: draw.shape
### Title: Draw shapefiles in an existing plot
### Aliases: draw.shape

### ** Examples

library(shapefiles)
shp.file <- file.path(system.file(package = "mapplots", "extdata"), "Ireland")
irl <- read.shapefile(shp.file)
xlim <- c(-11,-5.5)
ylim <- c(51.5,55.5)
basemap(xlim, ylim)
draw.shape(irl, col="cornsilk")



