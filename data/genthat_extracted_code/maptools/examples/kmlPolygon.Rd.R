library(maptools)


### Name: kmlPolygon
### Title: Create and write a KML file on the basis of a given Polygons
###   object
### Aliases: kmlPolygon
### Keywords: spatial

### ** Examples

data(wrld_simpl)
## creates a KML file containing the polygons of South Africa (plus hole)
sw <- slot(wrld_simpl[wrld_simpl$NAME=="South Africa",], "polygons")[[1]]
tf <- tempfile()
kmlPolygon(sw, kmlfile=tf, name="South Africa", col="#df0000aa", lwd=5, 
    border=4, kmlname="R Test", 
    kmldescription="This is <b>only</b> a <a href='http://www.r-project.org'>R</a> test.")
tf

## creates a KML file containing the polygons of South Africa, Switzerland, and Canada
sw  <- wrld_simpl[wrld_simpl$NAME %in% c("South Africa", "Switzerland", "Canada"),]
out <- sapply(slot(sw, "polygons"), function(x) { kmlPolygon(x,
    name=as(sw, "data.frame")[slot(x, "ID"), "NAME"], 
    col="red", lwd=1.5, border='black', 
    description=paste("ISO3:", slot(x, "ID"))) })
tf <- tempfile()
kmlFile <- file(tf, "w")
tf
cat(kmlPolygon(kmlname="R Test", kmldescription="<i>Hello</i>")$header, 
    file=kmlFile, sep="\n")
cat(unlist(out["style",]), file=kmlFile, sep="\n")
cat(unlist(out["content",]), file=kmlFile, sep="\n")
cat(kmlPolygon()$footer, file=kmlFile, sep="\n")
close(kmlFile)



