library(cartography)


### Name: north
### Title: North Arrow
### Aliases: north

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
box()
for (i in list("topleft", "top", "topright", "right", "bottomright", 
               "bottom", "bottomleft", "left", c(746368, 1632993))){
  north(i, south = TRUE)
}



