library(maptools)


### Name: kmlLines
### Title: Create and write a KML file on the basis of a given Lines object
### Aliases: kmlLines
### Keywords: spatial

### ** Examples

# Maptools library required
library(maptools)
# load line object
rivers <- readShapeSpatial(system.file("shapes/fylk-val-ll.shp",
                           package="maptools")[1], proj4string=CRS("+proj=longlat +ellps=WGS84"))
# create kml file
td <- tempdir()
kmlfile <- paste(td, "rivers.kml", sep="/")
kmlLines(rivers, kmlfile = kmlfile, name = "R Lines", 
         description = "Hello!", col = "blue", visibility = 1, lwd = 1, 
         kmlname = "", kmldescription = "")



