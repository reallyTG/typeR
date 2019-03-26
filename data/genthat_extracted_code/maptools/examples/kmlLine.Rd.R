library(maptools)


### Name: kmlLine
### Title: Create and write a KML file on the basis of a given Lines object
### Aliases: kmlLine
### Keywords: spatial

### ** Examples

xx <- readShapeSpatial(system.file("shapes/fylk-val-ll.shp",
      package="maptools")[1], proj4string=CRS("+proj=longlat +ellps=WGS84"))
out <- sapply(slot(xx, "lines"), function(x) { kmlLine(x,
    name=slot(x, "ID"), col="blue", lwd=1.5, 
    description=paste("river:", slot(x, "ID"))) })
tf <- tempfile()
kmlFile <- file(tf, "w")
tf
cat(kmlLine(kmlname="R Test", kmldescription="<i>Hello</i>")$header, 
    file=kmlFile, sep="\n")
cat(unlist(out["style",]), file=kmlFile, sep="\n")
cat(unlist(out["content",]), file=kmlFile, sep="\n")
cat(kmlLine()$footer, file=kmlFile, sep="\n")
close(kmlFile)



