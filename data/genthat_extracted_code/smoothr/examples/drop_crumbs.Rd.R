library(smoothr)


### Name: drop_crumbs
### Title: Remove small polygons or line segments
### Aliases: drop_crumbs

### ** Examples

# remove polygons smaller than 200km2
p <- jagged_polygons$geometry[7]
area_thresh <- units::set_units(200, km^2)
p_dropped <- drop_crumbs(p, threshold = area_thresh)
# plot
par(mar = c(0, 0, 1, 0), mfrow = c(1, 2))
plot(p, col = "black", main = "Original")
plot(p_dropped, col = "black", main = "After drop_crumbs()")

# remove lines less than 25 miles
l <- jagged_lines$geometry[8]
# note that any units can be used
# conversion to units of projection happens automatically
length_thresh <- units::set_units(25, miles)
l_dropped <- drop_crumbs(l, threshold = length_thresh)
# plot
par(mar = c(0, 0, 1, 0), mfrow = c(1, 2))
plot(l, lwd = 5, main = "Original")
plot(l_dropped, lwd = 5, main = "After drop_crumbs()")



