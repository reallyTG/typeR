library(cartography)


### Name: propTrianglesLayer
### Title: Double Proportional Triangle Layer
### Aliases: propTrianglesLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
# Employed Active Population 
mtq$OCC <- mtq$ACT-mtq$CHOM
plot(st_geometry(mtq), col = "lightblue4",border = "lightblue3",
     bg = "lightblue1")
propTrianglesLayer(x = mtq, var1 = "OCC", var2 = "CHOM", 
                   col1="green4",col2="red4",k = 0.1)
layoutLayer(title = "Active Population in Martinique, 2015")



