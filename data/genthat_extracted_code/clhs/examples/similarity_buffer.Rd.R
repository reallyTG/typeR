library(clhs)


### Name: similarity_buffer
### Title: Gower similarity analysis
### Aliases: similarity_buffer

### ** Examples

library(raster)
library(sp)

data(meuse.grid)
coordinates(meuse.grid) = ~x+y
proj4string(meuse.grid) <- CRS("+init=epsg:28992")
gridded(meuse.grid) = TRUE
ms <- stack(meuse.grid)
set.seed(1)
pts <- clhs(ms, size = 3, iter = 100, progress = FALSE, simple = TRUE)
gw <- similarity_buffer(ms, pts, buffer = 500)
plot(gw)




