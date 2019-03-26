library(cartography)


### Name: legendPropTriangles
### Title: Legend for Double Proportional Triangles Maps
### Aliases: legendPropTriangles

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
box()
var <- runif(10, 0,100)
var2 <- runif(10, 0,100)
r <- sqrt(var)*1000
r2 <- sqrt(var2)*1000
legendPropTriangles(pos = "topright", var.txt = "population 1",
                    var2.txt = "population 2", title.txt="Population totale",
                    title.cex = 0.8, values.cex = 0.6, cex = 1,
                    var = var, var2 = var2, r = r, r2 = r2,
                    col="green", col2="yellow", frame=TRUE, values.rnd=2,
                    style="c")



