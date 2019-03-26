library(leafletR)


### Name: leaflet
### Title: Create a Leaflet web-map
### Aliases: leaflet leaf
### Keywords: methods

### ** Examples

## Not run: 
##D # prepare data
##D data(quakes)
##D dat <- toGeoJSON(data=quakes, dest=tempdir())
##D 
##D # create and view simple map
##D map <- leaflet(dat, dest=tempdir())
##D map  # redirects to browseURL(map)
##D 
##D # set output directory and map title
##D map <- leaflet(data=dat, dest=tempdir(), title="Fiji Earthquakes")
##D 
##D # set map size, center and zoom level
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   size=c(800,600), center=c(-18.35, 179.75), zoom=6)
##D 
##D # set base map and popup/label
##D # magnitude is used as popup (type names(quakes) for available properties)
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   base.map="mqsat", popup="stations", label="mag")
##D   
##D # minimalist? - no base map
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   base.map=NA, popup="mag")
##D 
##D # include data in HTML file
##D map <- leaflet(dat, dest=tempdir(), incl.data=TRUE)
##D 
##D # preserve existing files from overwriting
##D map <- leaflet(dat, dest=tempdir(), overwrite=FALSE)
##D 
##D # more than one base map
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   base.map=list("osm", "mqsat", "tls"))
##D 
##D # multiple properties in the popup
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   popup=c("mag", "depth"))
##D 
##D # all available properties in the popup
##D map <- leaflet(data=dat, dest=tempdir(), 
##D   popup="*")
##D 
##D # change style
##D sty <- styleSingle(col="red", fill=NA)
##D map <- leaflet(data=dat, dest=tempdir(), base.map="mqsat", style=sty)
##D 
##D # controls
##D map <- leaflet(data=dat, dest=tempdir(), controls=NA)  # no controls
##D map <- leaflet(data=dat, dest=tempdir(), controls="scale")  # scale only
##D map <- leaflet(data=dat, dest=tempdir(), controls=c("zoom", "scale"))
##D 
##D # more than one data set
##D park <- system.file(package="leafletR", "files", "park_sk.geojson")
##D peak <- toGeoJSON(system.file(package="leafletR", "files", "peak_sk.kmz"), 
##D   dest=tempdir())  # httr package required
##D sty.1 <- styleSingle(col="green", fill="green")
##D sty.2 <- styleSingle(col="brown", fill="brown", rad=3)
##D map <- leaflet(data=list(park, peak), dest=tempdir(), 
##D   style=list(sty.1, sty.2), popup=list("*", "Name"))
##D 
##D # names in legend
##D # note: "_" and "." are replaced with blanks in the legend 
##D map <- leaflet(data=list(National_Parks=park, Peaks.above.600.m)=peak), 
##D   dest=tempdir(), style=list(sty.1, sty.2), popup=list("*", "Name"))
## End(Not run)



