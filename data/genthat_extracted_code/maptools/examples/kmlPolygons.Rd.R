library(maptools)


### Name: kmlPolygons
### Title: Create and write a KML file on the basis of a given Polygons
###   object or list of Polygons or SpatialPolygonsDataFrame
### Aliases: kmlPolygons
### Keywords: spatial

### ** Examples

data(wrld_simpl)
td <- tempdir()
kmlfile <- paste(td, "worldPolitical.kml", sep="/")
## creates a KML file containing the polygons of a political world map
kmlPolygons(wrld_simpl, kmlfile = kmlfile, name = "KML Polygons", 
         description = "the world", col = "red",
         visibility = 1, lwd = 1, border = "white", kmlname = "R Test", 
         kmldescription = "This is <b>only</b> a <a href='http://www.r-project.org'>R</a> test.")

data(wrld_simpl)
## create a KML file containing the polygons of Brazil, Uganda, and Canada
regions <- c("Brazil","Canada","Uganda")
wrld_simpl_subset <- wrld_simpl[wrld_simpl$NAME %in% regions,]
kmlfile <- paste(td, "worldPoliticalSubset.kml", sep="/")
kmlPolygons(wrld_simpl_subset, kmlfile = kmlfile,
 name = "KML Polygons subset", description = "three countries", col = "blue", 
 visibility = 1, lwd = 1, border = "white", kmlname = "R Test 2", 
 kmldescription = "This is <b>only</b> a <a href='http://www.r-project.org'>R</a> test.")
## combine to make a list of polygon objects to plot
polList <- c(regions,wrld_simpl)
kmlfile <- paste(td, "worldPoliticalandSubset.kml", sep="/")
kmlPolygons(wrld_simpl_subset, kmlfile = kmlfile,
 name = "KML Polygons subset", description = "three countries highlighted in world", 
 col = sample(colours(), length(polList)), visibility = 1, lwd = 1, border = "white", 
 kmlname = "R Test 2", 
 kmldescription = "This is <b>only</b> a <a href='http://www.r-project.org'>R</a> test.")




