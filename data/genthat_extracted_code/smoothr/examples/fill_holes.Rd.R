library(smoothr)


### Name: fill_holes
### Title: Fill small holes in polygons
### Aliases: fill_holes

### ** Examples

# fill holes smaller than 1000km2
p <- jagged_polygons$geometry[5]
area_thresh <- units::set_units(1000, km^2)
p_dropped <- fill_holes(p, threshold = area_thresh)
# plot
par(mar = c(0, 0, 1, 0), mfrow = c(1, 2))
plot(p, col = "black", main = "Original")
plot(p_dropped, col = "black", main = "After fill_holes()")



