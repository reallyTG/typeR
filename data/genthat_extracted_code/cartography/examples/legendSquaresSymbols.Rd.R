library(cartography)


### Name: legendSquaresSymbols
### Title: Legend for Proportional Squares Maps
### Aliases: legendSquaresSymbols

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
box()
legendSquaresSymbols(pos = "bottomright", title.txt = "Title of\nthe legend ",
                     title.cex = 0.8, values.cex = 0.6,
                     var = c(max(mtq$POP), min(mtq$POP)),
                     inches = 0.5,
                     col="red",  
                     frame=TRUE, values.rnd=0, style ="c")



