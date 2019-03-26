library(cartography)


### Name: getPencilLayer
### Title: Pencil Layer
### Aliases: getPencilLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
mtq_pencil <- getPencilLayer(x = mtq)
plot(st_geometry(mtq_pencil), col = 1:8)
plot(st_geometry(mtq), add = TRUE)

typoLayer(x = mtq_pencil, var="STATUS", 
          col = c("aquamarine4", "yellow3","wheat"),
          legend.values.order = c("Prefecture",
                                  "Sub-prefecture", 
                                  "Simple municipality"),
          legend.pos = "topright",
          legend.title.txt = "Status")
plot(st_geometry(mtq), add = TRUE, ldy=2)
layoutLayer(title = "Municipality Status")



