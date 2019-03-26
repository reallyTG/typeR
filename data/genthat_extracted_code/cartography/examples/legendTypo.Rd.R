library(cartography)


### Name: legendTypo
### Title: Legend for Typology Maps
### Aliases: legendTypo

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq))
box()

# Define labels and colors
someLabels <- c("red color", "yellow color", "green color", "black color")
someColors <- c("red", "yellow", "green", "black")

# plot legend
legendTypo(pos = "bottomleft", title.txt = "Title of the legend", title.cex = 0.8,
           values.cex = 0.6, col = someColors, categ = someLabels, 
           cex = 0.75,
           nodata = TRUE, nodata.txt = "no data", frame = TRUE, symbol="box")
legendTypo(pos = "topright", title.txt = "", 
           title.cex = 1.5, cex = 1.25,
           values.cex = 1, col = someColors, categ = someLabels, 
           nodata = FALSE, frame = FALSE, symbol="line")



