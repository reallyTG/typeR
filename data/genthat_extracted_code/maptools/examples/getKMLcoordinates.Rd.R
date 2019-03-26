library(maptools)


### Name: getKMLcoordinates
### Title: Get a list of coordinates out of a KML file
### Aliases: getKMLcoordinates
### Keywords: spatial

### ** Examples

data(wrld_simpl)
## creates a KML file containing the polygons of South Africa (plus hole)
sw <- slot(wrld_simpl[wrld_simpl$NAME=="South Africa",], "polygons")[[1]]
tf <- tempfile()
kmlPolygon(sw, kmlfile=tf, name="South Africa", col="#df0000aa", lwd=5, 
    border=4, kmlname="R Test", 
    kmldescription="This is <b>only</b> a <a href='http://www.r-project.org'>R</a> test.")
zz <- getKMLcoordinates(tf, ignoreAltitude=TRUE)
str(zz)
zz <- getKMLcoordinates(system.file("shapes/Testing.kml", package="maptools"))
str(zz)



