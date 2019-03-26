library(cartography)


### Name: discLayer
### Title: Discontinuities Layer
### Aliases: discLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
# Get borders
mtq.borders <- getBorders(x = mtq)
# Median Income 
choroLayer(x = mtq, var = "MED", border = "grey", lwd = 0.5, 
           method = 'equal', nclass = 6, legend.pos = "topleft",
           legend.title.txt = "Median Income\n(in euros)" )
# Discontinuities
discLayer(x = mtq.borders, df = mtq,
          var = "MED", col="red4", nclass=3,
          method="equal", threshold = 0.4, sizemin = 0.5,
          sizemax = 10, type = "abs",legend.values.rnd = 0,
          legend.title.txt = "Discontinuities\n(absolute difference)",
          legend.pos = "bottomleft", add=TRUE)



