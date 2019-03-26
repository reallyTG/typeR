library(SpatialPosition)


### Name: contourStewart
### Title: Create a SpatialPolygonsDataFrame or a SpatialLinesDataFrame
###   from a Stewart Raster
### Aliases: contourStewart

### ** Examples

data("spatData")
## Not run: 
##D #### Example with type = "line"
##D mystewart <- stewart(knownpts = spatPts, varname = "Capacite",
##D                      typefct = "exponential", span = 1000, beta = 3,
##D                      resolution = 50,
##D                      mask = spatMask)
##D # Create a raster of potentials values
##D mystewartraster <- rasterStewart(x = mystewart, mask = spatMask)
##D # Display the raster and get break values
##D break.values <- plotStewart(x = mystewartraster)
##D # Create contour SpatialLinesDataFrame
##D mystewartcontourpoly <- contourStewart(x = mystewartraster,
##D                                        breaks = break.values,
##D                                        type = "line")
##D # Display the Map
##D plot(spatMask, add=TRUE)
##D plot(mystewartcontourpoly, border = "grey40",add = TRUE)
##D plot(spatPts, cex = 0.8, pch = 20, col  = "black", add = TRUE)
##D 
##D 
##D 
##D #### Example with type = "poly"
##D mystewart <- stewart(knownpts = spatPts, varname = "Capacite",
##D                      typefct = "exponential", span = 1000, beta = 3,
##D                      resolution = 50, longlat = FALSE,
##D                      mask = spatMask)
##D # Create a raster of potentials valuesn, no mask
##D mystewartraster <- rasterStewart(x = mystewart)
##D # Display the raster and get break values
##D break.values <- plotStewart(x = mystewartraster)
##D # Create contour SpatialLinesDataFrame
##D mystewartcontourpoly <- contourStewart(x = mystewartraster,
##D                                        breaks = break.values,
##D                                        mask = spatMask,
##D                                        type = "poly")
##D # Display the map
##D library(cartography)
##D opar <- par(mar = c(0,0,1.1,0))
##D choroLayer(spdf = mystewartcontourpoly, 
##D            df = mystewartcontourpoly@data, 
##D            var = "mean", legend.pos = "topleft",
##D            breaks = break.values, border = "grey90", 
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



