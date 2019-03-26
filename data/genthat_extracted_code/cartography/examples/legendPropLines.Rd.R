library(cartography)


### Name: legendPropLines
### Title: Legend for Proportional Lines Maps
### Aliases: legendPropLines

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
box()
legendPropLines(pos = "topleft", title.txt = "Title",
                title.cex = 0.8, values.cex = 0.6, cex = 1,
                var = c(10,100),
                lwd = 15,
                col="red", frame=TRUE, values.rnd=0)



