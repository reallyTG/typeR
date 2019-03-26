library(rgeos)


### Name: gContains
### Title: Geometry Relationships - Contains and Within
### Aliases: gContains gContainsProperly gCovers gCoveredBy gWithin
###   RGEOSContains RGEOSWithin
### Keywords: spatial

### ** Examples

	l1 = readWKT("LINESTRING(0 3,1 1,2 2,3 0)")
	l2 = readWKT("LINESTRING(1 3.5,3 3,2 1)")
	l3 = readWKT("LINESTRING(1 3.5,3 3,4 1)")
	
	pt1 = readWKT("MULTIPOINT(1 1,3 0)")
	pt2 = readWKT("MULTIPOINT(0 3,3 0)")
	pt3 = readWKT("MULTIPOINT(1 1,2 2,3 1)")
	
	p1 = readWKT("POLYGON((0 0,0 2,1 3.5,3 3,4 1,3 0,0 0))")
	p2 = readWKT("POLYGON((1 1,1 2,2 2,2 1,1 1))")

	
	par(mfrow=c(2,3))
	plot(l1,col='blue');plot(pt1,add=TRUE,pch=16)
	title(paste("Contains:",gContains(l1,pt1),
				"\nContainsProperly:",gContainsProperly(l1,pt1),
				"\nCovers:",gCovers(l1,pt1)))
	
	plot(l1,col='blue');plot(pt2,add=TRUE,pch=16)
	title(paste("Contains:",gContains(l1,pt2),
				"\nContainsProperly:",gContainsProperly(l1,pt2),
				"\nCovers:",gCovers(l1,pt2)))
	
	plot(p1,col='blue',border='blue');plot(pt3,add=TRUE,pch=16)
	title(paste("Contains:",gContains(p1,pt3),
				"\nContainsProperly:",gContainsProperly(p1,pt3),
				"\nCovers:",gCovers(p1,pt3)))
	
	plot(p1,col='blue',border='blue');plot(l2,lwd=2,add=TRUE,pch=16)
	title(paste("Contains:",gContains(p1,l2),
				"\nContainsProperly:",gContainsProperly(p1,l2),
				"\nCovers:",gCovers(p1,l2)))

	plot(p1,col='blue',border='blue');plot(l3,lwd=2,add=TRUE,pch=16)
	title(paste("Contains:",gContains(p1,l3),
				"\nContainsProperly:",gContainsProperly(p1,l3),
				"\nCovers:",gCovers(p1,l3)))

	plot(p1,col='blue',border='blue');plot(p2,col='black',add=TRUE,pch=16)
	title(paste("Contains:",gContains(p1,p2),
				"\nContainsProperly:",gContainsProperly(p1,p2),
				"\nCovers:",gCovers(p1,p2)))
	
	



