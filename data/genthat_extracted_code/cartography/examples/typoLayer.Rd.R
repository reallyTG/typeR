library(cartography)


### Name: typoLayer
### Title: Typology Layer
### Aliases: typoLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
typoLayer(x = mtq, var="STATUS",  
          col = c("aquamarine4", "yellow3","wheat"),
          legend.values.order = c("Prefecture",
                                  "Sub-prefecture", 
                                  "Simple municipality"),
          legend.pos = "topright",
          legend.title.txt = "Status")
layoutLayer(title = "Municipality Status")



