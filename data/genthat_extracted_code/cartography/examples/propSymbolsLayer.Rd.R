library(cartography)


### Name: propSymbolsLayer
### Title: Proportional Symbols Layer
### Aliases: propSymbolsLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
propSymbolsLayer(x = mtq, var = "POP")

plot(st_geometry(mtq), col = "lightblue4",border = "lightblue3", 
     bg = "lightblue1")
# Population plot on proportional symbols
propSymbolsLayer(x = mtq, var = "POP",
                 symbols = "circle", col =  "white",
                 legend.pos = "right", border = "grey",
                 legend.title.txt = "Total\nPopulation",
                 legend.style = "c")
# Layout plot
layoutLayer(title = "Population Distribution in Martinique, 2015")



