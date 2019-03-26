library(leafletR)


### Name: styleSingle
### Title: Single symbol styling
### Aliases: styleSingle singles
### Keywords: methods

### ** Examples

## Not run: 
##D ## point data ##
##D # prepare data
##D data(quakes)
##D dat <- toGeoJSON(data=quakes, dest=tempdir())
##D 
##D # change circle borders
##D # note: if fill color is not specified, col is also used as fill color 
##D sty <- styleSingle(col=2, lwd=1, alpha=1)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # change fill color, alpha and radius
##D sty <- styleSingle(fill="red", fill.alpha=1, rad=2)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # no border
##D sty <- styleSingle(col=NA)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # blank circle area
##D sty <- styleSingle(fill=NA)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # simple colored markers
##D sty <- styleSingle(marker="red") # only color
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # markers with label, color and size
##D sty <- styleSingle(marker=c("triangle", "#E41A1C", "s"))
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # change all arguments
##D sty <- styleSingle(col="#d4d4d4", lwd=1, alpha=0.8, 
##D   fill="darkred", fill.alpha=0.4, rad=4)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D 
##D ## line data ##
##D # prepare data
##D # (httr package required)
##D dat <- toGeoJSON(data=system.file(package="leafletR", "files", 
##D   "lynx.zip"), name="Lynx telemetry", dest=tempdir())
##D 
##D # style
##D sty <- styleSingle(col="#bb650b", lwd=3, alpha=0.8)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D 
##D ## polygon data ##
##D # prepare data
##D dat <- system.file(package="leafletR", "files", "park_sk.geojson")
##D 
##D # change borders
##D # note: if fill color is not specified, col is also used as fill color 
##D sty <- styleSingle(col=3, lwd=2, alpha=1)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # change fill color and alpha
##D sty <- styleSingle(fill="darkgreen", fill.alpha=0.8)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # no border
##D sty <- styleSingle(col=NA)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # blank polygon area
##D sty <- styleSingle(fill=NA)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
##D 
##D # change all arguments
##D sty <- styleSingle(col="#006400", lwd=5, alpha=0.8, 
##D   fill="darkgreen", fill.alpha=0.4)
##D map <- leaflet(data=dat, dest=tempdir(), style=sty)
## End(Not run)



