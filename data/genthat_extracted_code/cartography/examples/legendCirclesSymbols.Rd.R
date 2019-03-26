library(cartography)


### Name: legendCirclesSymbols
### Title: Legend for Proportional Circles Maps
### Aliases: legendCirclesSymbols

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
box()

propSymbolsLayer(x = mtq, var = "POP",
                 inches = 0.2, legend.pos = "n")

legendCirclesSymbols(pos = "topleft", inches = 0.2,
                     var = c(min(mtq$POP), max(mtq$POP)))
legendCirclesSymbols(pos = "left",
                     var = c(min(mtq$POP), max(mtq$POP)),
                     inches = 0.2, style = "e")
legendCirclesSymbols(pos = "bottomleft",
                     var = c(600, 12000, 40000, max(mtq$POP)),
                     inches = 0.2, style = "c")
legendCirclesSymbols(pos = "topright", cex = 2,
                     var = c(600, 30000,max(mtq$POP)),
                     inches = 0.2, style = "e", frame = TRUE)
legendCirclesSymbols(pos = c(736164.4, 1596658),
                     var = c(min(mtq$POP),max(mtq$POP)),
                     inches = 0.2, frame = TRUE)



