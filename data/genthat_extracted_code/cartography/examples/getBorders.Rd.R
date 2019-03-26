library(cartography)


### Name: getBorders
### Title: Extract Polygons Borders
### Aliases: getBorders

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
# Get borders
mtq.borders <- getBorders(x = mtq)
# Plot polygons
plot(st_geometry(mtq), border = NA, col = "grey60")
# Plot borders
plot(st_geometry(mtq.borders), 
     col = sample(x = rainbow(nrow(mtq.borders))), 
     lwd = 3, add = TRUE)



