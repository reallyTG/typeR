library(cartography)


### Name: legendBarsSymbols
### Title: Legend for Proportional Bars Maps
### Aliases: legendBarsSymbols

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
box()
legendBarsSymbols(pos = "topleft", title.txt = "Title of\nthe legend",
                     title.cex = 0.8, values.cex = 0.6,cex = 1,
                     var = c(min(mtq$POP),max(mtq$POP)),
                     inches = 0.5,
                     col = "purple",
                     values.rnd=0, style ="e")



