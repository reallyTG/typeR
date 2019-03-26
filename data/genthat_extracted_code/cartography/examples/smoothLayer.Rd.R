library(cartography)


### Name: smoothLayer
### Title: Smooth Layer
### Aliases: smoothLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
smoothLayer(x = mtq, var = 'POP',
            span = 4000, beta = 2,
            mask = mtq, border = NA,
            col = carto.pal(pal1 = 'wine.pal', n1 = 8),
            legend.title.txt = "Population\nPotential",
            legend.pos = "topright", legend.values.rnd = 0)
propSymbolsLayer(x = mtq, var = "POP", legend.pos = c(690000, 1599950),
                 legend.title.txt = "Population 2015",
                 col = NA, border = "#ffffff50")
layoutLayer(title = "Actual and Potential Popultation in Martinique")



