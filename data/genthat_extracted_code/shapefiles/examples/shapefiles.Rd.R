library(shapefiles)


### Name: shapefiles
### Title: Read and write ESRI shapefiles
### Aliases: read.shapefile read.shp read.shx read.dbf write.shapefile
###   write.shp write.shx write.dbf calc.header add.xy scaleXY
###   convert.to.shapefile convert.to.simple change.id dp
### Keywords: programming

### ** Examples

## Not run: 
##D #Read entire shapefile
##D shapefile <- read.shapefile("links")
##D 
##D #Write entire shapefile
##D write.shapefile(shapefile, "temp", T)
##D 
##D #Read shp, shx, or dbf file
##D dbf <- read.dbf("links.dbf")
##D 
##D #Write shp, shx, or dbf file
##D write.dbf(dbf, "links.dbf", T)
##D 
##D #Calculate header (to clean up GeoMedia shapefile exports)
##D shapefile <- calc.header(shapefile)
##D 
##D #Add the X and Y coordinates to the dbf list of the shapefile list object
##D shapefile <- add.xy(shapefile)
##D 
##D #Scale the shapefile by scale.factor
##D shapefile <- scaleXY(shapefile, scale.factor)
##D 
##D #Samples of using the convert.to.shapefile function to write out simple shapefiles
##D #from basic R data.frames
##D 
##D #Point
##D dd <- data.frame(Id=c(1,2),X=c(3,5),Y=c(9,6))
##D ddTable <- data.frame(Id=c(1,2),Name=c("Item1","Item2"))
##D ddShapefile <- convert.to.shapefile(dd, ddTable, "Id", 1)
##D write.shapefile(ddShapefile, "c:/test", arcgis=T)
##D 
##D #PolyLine
##D dd <- data.frame(Id=c(1,1,1,2,2,2),X=c(3,5,8,6,7,8),Y=c(9,8,3,6,7,4))
##D ddTable <- data.frame(Id=c(1,2),Name=c("Item1","Item2"))
##D ddShapefile <- convert.to.shapefile(dd, ddTable, "Id", 3)
##D write.shapefile(ddShapefile, "c:/test", arcgis=T)
##D 
##D #Polygon
##D dd <- data.frame(Id=c(1,1,1,1,2,2,2,2),X=c(3,5,8,3,6,7,8,6),Y=c(9,8,3,9,6,7,4,6))
##D ddTable <- data.frame(Id=c(1,2),Name=c("Item1","Item2"))
##D ddShapefile <- convert.to.shapefile(dd, ddTable, "Id", 5)
##D write.shapefile(ddShapefile, "c:/test", arcgis=T)
##D 
##D #Convert to list of shapes
##D ddAsList <- by(dd,dd$Id, function(x) x)
##D 
##D #Convert to data.frame
##D dd <- do.call(rbind, ddAsList)
##D 
##D #Read in shp file and convert to simple format
##D shpTest <- read.shp("c:/test.shp")
##D simpleShpFormat <- convert.to.simple(shpTest)
##D simpleShpFormat <- change.id(simpleShpFormat, c("a","b"))
##D simpleAsList <- by(simpleShpFormat, simpleShpFormat[,1], function(x) x)
##D backToShape <- convert.to.shapefile(simpleShpFormat, 
##D 	data.frame(index=c("a","b")), "index", 5)
##D write.shapefile(backToShape, "c:/test", arcgis=T)
##D 
##D #Polyline simplification with dp algorithm
##D x <- c(5,3,4,1,8,9,10,11)
##D y <- c(6,4,2,1,1,5,2,3)
##D points <- list(x=x,y=y)
##D plot(points, type="l")
##D simpleLine <- dp(points, 2)
##D lines(simpleLine, type="l", col="blue")
##D 
## End(Not run)



