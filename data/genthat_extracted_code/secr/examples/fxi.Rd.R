library(secr)


### Name: fxi
### Title: Probability Density of Home Range Centre
### Aliases: fxi.contour fxi.mode fxi.secr fxi
### Keywords: hplot

### ** Examples


fxi.secr(secrdemo.0, i = 1, X = c(365,605))

## contour first 5 detection histories
plot(secrdemo.0$capthist)
fxi.contour (secrdemo.0, i = 1:5, add = TRUE,
    plotmode = TRUE, drawlabels = FALSE)

## Not run: 
##D 
##D   ## extract modes only
##D   ## these are more reliable than those from fit.mode called directly as
##D   ## they use a contour-based approximation for the starting point
##D   fxiout <- fxi.contour (secrdemo.0, i = 1:5, plt = FALSE, fitmode = TRUE)
##D   t(sapply(fxiout, "[[", "mode"))
##D 
##D   ## using fill colours
##D   ## lty = 0 suppresses contour lines
##D   ## nx = 256 ensures smooth outline
##D   plot(traps(captdata))
##D   fxi.contour(secrdemo.0, i = 1:5, add = TRUE, p = c(0.5,0.95), drawlabels
##D       = FALSE, nx = 256, fill = topo.colors(4), lty = 0)
##D 
##D   ## output as SpatialPolygonsDataFrame
##D   spdf <- fxi.contour(secrdemo.0, i = 1:3, plt = FALSE, p = c(0.5,0.95),
##D       nx = 256, SPDF = TRUE, fitmode = TRUE)
##D 
##D   ## save as ESRI shapefile
##D   library(maptools)
##D   writeSpatialShape(spdf, fn = "test")
##D 
##D   ## plot contours and modes
##D   plot(spdf)
##D   points(data.frame(spdf))
##D 
## End(Not run)




