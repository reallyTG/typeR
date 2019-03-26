library(hyperSpec)


### Name: makeraster
### Title: makeraster
### Aliases: makeraster fitraster

### ** Examples

x <- c (sample (1:20, 10), (0 : 5) + 0.5)
raster <- makeraster (x, x [1], 2)
raster
plot (x)
abline (h = raster$levels, col = "#00000040")

## unoccupied levels
missing <- setdiff (raster$levels, raster$x)
abline (h = missing, col = "red")

## points acutally on the raster
onraster <- raster$x %in% raster$levels
points (which (onraster), raster$x [onraster], col = "blue", pch = 20)


raster <- fitraster (x)
raster
plot (x)
abline (h = raster$levels, col = "#00000040")

## unoccupied levels
missing <- setdiff (raster$levels, raster$x)
abline (h = missing, col = "red")

## points acutally on the raster
onraster <- raster$x %in% raster$levels
points (which (onraster), raster$x [onraster], col = "blue", pch = 20)

x <- c (sample (1:20, 10), (0 : 5) + 0.45)
raster <- fitraster (x)
raster
plot (x)
abline (h = raster$levels, col = "#00000040")

## unoccupied levels
missing <- setdiff (raster$levels, raster$x)
abline (h = missing, col = "red")

## points acutally on the raster
onraster <- raster$x %in% raster$levels
points (which (onraster), raster$x [onraster], col = "blue", pch = 20)




