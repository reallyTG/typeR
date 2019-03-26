library(leafletR)


### Name: styleGrad
### Title: Graduated styling
### Aliases: styleGrad grads
### Keywords: methods

### ** Examples

## Not run: 
##D # prepare data
##D data(quakes)
##D qks <- toGeoJSON(data=quakes, dest=tempdir())
##D 
##D # prepare style
##D range(quakes$mag)	# gives 4.0 and 6.4
##D sty <- styleGrad(prop="mag", breaks=seq(4, 6.5, by=0.5), 
##D   style.val=rev(heat.colors(5)), leg="Richter Magnitude")
##D 
##D # create map
##D map <- leaflet(data=qks, dest=tempdir(), 
##D   title="Fiji Earthquakes", style=sty)
##D 
##D # find class intervals and colors using the classInt package
##D library(classInt)
##D brks <- classIntervals(quakes$mag, 7)
##D cols <- findColours(brks, c("yellow", "red", "darkred"))
##D sty <- styleGrad(prop="mag", breaks=brks, style.val=cols, 
##D   leg="Richter Magnitude")
##D map <- leaflet(data=qks, dest=tempdir(), 
##D    title="Fiji Earthquakes", style=sty)
##D 
##D # intervals closed right
##D # note the gray points on the map: magnitude of 4 is outside the breaks
##D # (which are >4.0, >4.5, >5.0, >5.5, >6.0 and >6.5)
##D sty <- styleGrad(prop="mag", breaks=seq(4, 6.5, by=0.5), closure="right", 
##D   style.val=rev(heat.colors(5)), leg="Richter Magnitude")
##D map <- leaflet(data=qks, dest=tempdir(), 
##D   title="Fiji Earthquakes", style=sty)
##D 
##D # handle outliers
##D sty <- styleGrad(prop="mag", breaks=seq(5, 6.4, by=0.2), 
##D   out=2, style.val=c("white", rev(heat.colors(7))), leg="Richter Magnitude")
##D map <- leaflet(data=qks, dest=tempdir(), 
##D   title="Fiji Earthquakes", style=sty)
##D 
##D # graduated radius
##D sty <- styleGrad(prop="mag", breaks=seq(4, 6.5, by=0.5), style.par="rad", 
##D   style.val=c(2,5,9,14,20), leg="Richter Magnitude")
##D map <- leaflet(data=qks, dest=tempdir(), 
##D   title="Fiji Earthquakes", style=sty)
##D 
##D # additional styling parameters
##D peak <- toGeoJSON(data=system.file(package="leafletR", "files", 
##D   "peak_sk.kmz"), dest=tempdir())  # httr package required
##D sty <- styleGrad(prop="Name", breaks=seq(750, 2500, by=250), out=3, 
##D   style.val=terrain.colors(9), leg="Elevation", 
##D   col=NA, fill.alpha=1, rad=3)
##D map <- leaflet(data=peak, dest=tempdir(), title="Peak elevation", 
##D   base.map="mqsat", style=sty, popup="Name")
## End(Not run)



