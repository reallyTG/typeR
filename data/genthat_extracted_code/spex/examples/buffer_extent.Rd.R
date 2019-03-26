library(spex)


### Name: buffer_extent
### Title: Whole grain buffers
### Aliases: buffer_extent

### ** Examples

library(raster)
buffer_extent(extent(0.1, 2.2, 0, 3), 2)

p <- par(xpd = NA) 
plot(lux)
plot(extent(lux), lty = 2, add = TRUE, col = "grey")
plot(buffer_extent(lux, 0.1), add = TRUE)
abline(v = c(5.7, 6.6), h = c(49.4, 50.2))
title("boundaries on clean alignment to 0.1")
par(p)



