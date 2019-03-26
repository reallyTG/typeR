library(cartography)


### Name: getGridLayer
### Title: Build a Regular Grid Layer
### Aliases: getGridLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
# Plot dentsity of population
mtq$POPDENS <- 1e6 * mtq$POP / st_area(mtq) 
bks <- getBreaks(v = mtq$POPDENS, method = "geom", 5)
cols <- carto.pal(pal1 = "taupe.pal", n1 = 5)
opar <- par(mfrow = c(1,2), mar = c(0,0,0,0))
choroLayer(x = mtq, var = "POPDENS", breaks = bks,
           border = "burlywood3", col = cols,
           legend.pos = "topright", legend.values.rnd = 0,
           legend.title.txt = "Population density")

mygrid <- getGridLayer(x = mtq, cellsize = 3e7,
                       type = "hexagonal", var = "POP")
## conversion from square meter to square kilometers
mygrid$POPDENSG <- 1e6 * mygrid$POP / mygrid$gridarea 
choroLayer(x = mygrid, var = "POPDENSG", breaks = bks,
           border = "burlywood3", col = cols,
           legend.pos = "n", legend.values.rnd = 1,
           legend.title.txt = "Population density")
par(opar)



