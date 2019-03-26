library(gdtools)


### Name: raster_write
### Title: Draw/preview a raster to a png file
### Aliases: raster_write

### ** Examples

r <- as.raster(matrix(hcl(0, 80, seq(50, 80, 10)),
 nrow = 4, ncol = 5))
raster_write(x = r, path = "raster.png", width = 50, height = 50)



