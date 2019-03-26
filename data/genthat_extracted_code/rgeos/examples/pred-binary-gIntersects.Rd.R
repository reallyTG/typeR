library(rgeos)


### Name: gIntersects
### Title: Geometry Relationships - Intersects and Disjoint
### Aliases: gIntersects RGEOSIntersects gDisjoint RGEOSDisjoint
### Keywords: spatial

### ** Examples

	p1 = readWKT("POLYGON((0 0,1 0,1 1,0 1,0 0))")
	p2 = readWKT("POLYGON((0.5 1,0 2,1 2,0.5 1))")
	p3 = readWKT("POLYGON((0.5 0.5,0 1.5,1 1.5,0.5 0.5))")

	l1 = readWKT("LINESTRING(0 3,1 1,2 2,3 0)")
	l2 = readWKT("LINESTRING(1 3.5,3 3,2 1)")
	l3 = readWKT("LINESTRING(-0.1 0,-0.1 1.1,1 1.1)")
	
	pt1 = readWKT("MULTIPOINT(1 1,3 0,2 1)")
	pt2 = readWKT("MULTIPOINT(0 3,3 0,2 1)")
	pt3 = readWKT("MULTIPOINT(-0.2 0,1 -0.2,1.2 1,0 1.2)")

	
	par(mfrow=c(3,2))
	plot(p1,col='blue',border='blue',ylim=c(0,2.5));plot(p2,col='black',add=TRUE,pch=16)
	title(paste("Intersects:",gIntersects(p1,p2),
				"\nDisjoint:",gDisjoint(p1,p2)))
	
	plot(p1,col='blue',border='blue',ylim=c(0,2.5));plot(p3,col='black',add=TRUE,pch=16)
	title(paste("Intersects:",gIntersects(p1,p3),
				"\nDisjoint:",gDisjoint(p1,p3)))
				
	plot(l1,col='blue');plot(pt1,add=TRUE,pch=16)
	title(paste("Intersects:",gIntersects(l1,pt1),
				"\nDisjoint:",gDisjoint(l1,pt1)))
	
	plot(l1,col='blue');plot(pt2,add=TRUE,pch=16)
	title(paste("Intersects:",gIntersects(l1,pt2),
				"\nDisjoint:",gDisjoint(l1,pt2)))
	
	plot(p1,col='blue',border='blue',xlim=c(-0.5,2),ylim=c(0,2.5))
	plot(l3,lwd=2,col='black',add=TRUE)
	title(paste("Intersects:",gIntersects(p1,l3),
				"\nDisjoint:",gDisjoint(p1,l3)))
	
	plot(p1,col='blue',border='blue',xlim=c(-0.5,2),ylim=c(-0.5,2))
	plot(pt3,pch=16,col='black',add=TRUE)
	title(paste("Intersects:",gIntersects(p1,pt3),
				"\nDisjoint:",gDisjoint(p1,pt3)))



