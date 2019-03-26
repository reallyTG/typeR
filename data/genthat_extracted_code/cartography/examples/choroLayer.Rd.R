library(cartography)


### Name: choroLayer
### Title: Choropleth Layer
### Aliases: choroLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
# Population density
mtq$POPDENS <- 1e6 * mtq$POP / st_area(x = mtq)

# Default
choroLayer(x = mtq, var = "POPDENS")

# With parameters 
choroLayer(x = mtq, var = "POPDENS",
           method = "quantile", nclass = 5,
           col = carto.pal(pal1 = "sand.pal", n1 = 5),
           border = "grey40",
           legend.pos = "topright", legend.values.rnd = 0,
           legend.title.txt = "Population Density\n(people per km2)")

# Layout
layoutLayer(title = "Population Distribution in Martinique, 2015")



