library(cartography)


### Name: propSymbolsTypoLayer
### Title: Proportional Symbols Typo Layer
### Aliases: propSymbolsTypoLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
# Countries plot
plot(st_geometry(mtq), col = "lightblue4",border = "lightblue3", 
     bg = "lightblue1")
# Population plot on proportional symbols
propSymbolsTypoLayer(x = mtq, var = "POP", var2 = "STATUS",
                     symbols = "circle",
                     col = c("aquamarine4", "yellow3","wheat"),
                     legend.var2.values.order = c("Prefecture",
                                                  "Sub-prefecture",
                                                  "Simple municipality"),
                     legend.var.pos = "right", border = "grey",
                     legend.var.title.txt = "Total\nPopulation")
layoutLayer(title = "Population Distribution in Martinique, 2015")



