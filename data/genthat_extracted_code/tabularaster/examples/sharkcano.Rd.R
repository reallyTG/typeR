library(tabularaster)


### Name: sharkcano
### Title: Sharkcano, the shark and the volcano.
### Aliases: sharkcano

### ** Examples

library(raster)
rd <- attr(sharkcano, "rasterdim")
rastershark <- raster(matrix(NA_integer_, rd[1], rd[2]))
rastershark[sharkcano$cell_] <- sharkcano$byte  ## byte, heh
## I present to you, Sharkcano!  (Just wait for the 3D version, Quadshark).
#plot(rastercano)
#contour(rastershark, add = TRUE, labels = FALSE)
#plot(rastershark, col = "black")
## another way
#plot(rastercano)
#points(xyFromCell(rastershark, sharkcano$cell_), pch = ".")



