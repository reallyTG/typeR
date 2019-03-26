library(cartography)


### Name: dotDensityLayer
### Title: Dot Density layer
### Aliases: dotDensityLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq), col = "#B8704D50")
dotDensityLayer(x = mtq,  var="POP", pch=20, col = "red4", n = 50)
layoutLayer(title = "Population Distribution in Martinique, 2015")



