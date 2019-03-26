library(rgeos)


### Name: gCrosses
### Title: Geometry Relationships - Crosses and Overlaps
### Aliases: gCrosses RGEOSCrosses gOverlaps RGEOSOverlaps
### Keywords: spatial

### ** Examples

	l1 = readWKT("LINESTRING(0 3,1 1,2 2,3 0)")
	l2 = readWKT("LINESTRING(0 0.5,1 1,2 2,3 2.5)")
	l3 = readWKT("LINESTRING(1 3,1.5 1,2.5 2)")
	
	pt1 = readWKT("MULTIPOINT(1 1,3 0)")
	pt2 = readWKT("MULTIPOINT(1 1,3 0,1 2)")

	p1 = readWKT("POLYGON((0 0,0 2,1 3.5,3 3,4 1,3 0,0 0))")
	p2 = readWKT("POLYGON((2 2,3 4,4 1,4 0,2 2))")
	
	par(mfrow=c(2,3))
	plot(l1,col='blue');plot(pt1,add=TRUE,pch=16)
	title(paste("Crosses:",gCrosses(l1,pt1),
				"\nOverlaps:",gOverlaps(l1,pt1)))
	
	plot(l1,col='blue');plot(pt2,add=TRUE,pch=16)
	title(paste("Crosses:",gCrosses(l1,pt2),
				"\nOverlaps:",gOverlaps(l1,pt2)))
				
	plot(l1,col='blue');plot(l2,add=TRUE)
	title(paste("Crosses:",gCrosses(l1,l2),
				"\nOverlaps:",gOverlaps(l1,l2)))
				
	plot(l1,col='blue');plot(l3,add=TRUE)
	title(paste("Crosses:",gCrosses(l1,l3),
				"\nOverlaps:",gOverlaps(l1,l3)))
				
	plot(p1,border='blue',col='blue');plot(l1,add=TRUE)
	title(paste("Crosses:",gCrosses(p1,l1),
				"\nOverlaps:",gOverlaps(p1,l1)))

	plot(p1,border='blue',col='blue');plot(p2,add=TRUE)
	title(paste("Crosses:",gCrosses(p1,p2),
				"\nOverlaps:",gOverlaps(p1,p2)))
				



