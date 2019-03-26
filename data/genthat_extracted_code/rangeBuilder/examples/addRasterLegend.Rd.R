library(rangeBuilder)


### Name: addRasterLegend
### Title: Add a legend to a raster plot
### Aliases: addRasterLegend

### ** Examples

r <- raster(system.file("external/test.grd", package="raster"))

plot(r, legend = FALSE)
addRasterLegend(r, location = 'right')
addRasterLegend(r, location = 'top')

#fine-tune placement
plot(r, legend = FALSE)
addRasterLegend(r, location=c(181000, 181100, 330500, 331500), side = 4)



