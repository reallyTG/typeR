library(SpatialPosition)


### Name: rasterToContourPoly
### Title: Create a SpatialPolygonsDataFrame from a Raster
### Aliases: rasterToContourPoly

### ** Examples

data("spatData")
## Not run: 
##D mystewart <- stewart(knownpts = spatPts, varname = "Capacite",
##D                      typefct = "exponential", span = 1000, beta = 3,
##D                      resolution = 50, mask = spatMask)
##D # Create a raster of potentials values
##D mystewartraster <- rasterStewart(x = mystewart)
##D # Create contour SpatialLinesDataFrame
##D contourpoly <- rasterToContourPoly(r = mystewartraster,
##D                                    nclass = 6,
##D                                    mask = spatMask)
##D # Created breaks
##D bks <- sort(unique(c(contourpoly$min, contourpoly$max)))
##D # Display the map
##D library(cartography)
##D opar <- par(mar = c(0,0,1.2,0))
##D choroLayer(spdf = contourpoly,
##D            df = contourpoly@data,
##D            var = "center", legend.pos = "topleft",
##D            breaks = bks, border = "grey90",
##D            lwd = 0.2,
##D            legend.title.txt = "Potential number\nof beds in the\nneighbourhood",
##D            legend.values.rnd = 0)
##D plot(spatMask, add = TRUE)
##D propSymbolsLayer(spdf = spatPts, df = spatPts@data, var = "Capacite",
##D                  legend.title.txt = "Number of beds",
##D                  col = "#ff000020")
##D layoutLayer(title = "Global Accessibility to Public Hospitals",
##D             south = TRUE, sources = "", author = "")
##D par(opar)
## End(Not run)



