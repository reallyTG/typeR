library(cartography)


### Name: labelLayer
### Title: Label Layer
### Aliases: labelLayer

### ** Examples

library(sf)
opar <- par(mar = c(0,0,0,0))
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq), col = "darkseagreen3", border = "darkseagreen4", 
     bg = "#A6CAE0")
labelLayer(x = mtq, txt = "LIBGEO", col= "black", cex = 0.7, font = 4,
           halo = TRUE, bg = "white", r = 0.1, 
           overlap = FALSE, show.lines = FALSE)
par(opar)



