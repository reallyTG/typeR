library(rgeos)


### Name: gTouches
### Title: Geometry Relationships - Touches
### Aliases: gTouches RGEOSTouches
### Keywords: spatial

### ** Examples


	p1 = readWKT("POLYGON((0 0,1 0,1 1,0 1,0 0))")
	p2 = readWKT("POLYGON((0 1,0.5 2,1 1,0 1))")
	p3 = readWKT("POLYGON((0.5 1,0 2,1 2,0.5 1))")
	p4 = readWKT("POLYGON((0.5 0.5,0 1.5,1 1.5,0.5 0.5))")
	
	l0 = readWKT("LINESTRING(0 1,0.5 2,1 1)")
	
	l1 = readWKT("LINESTRING(0 0,2 2)")
	l2 = readWKT("LINESTRING(1 1,2 0)")
	l3 = readWKT("LINESTRING(0 2,2 0)")
	
	
	par(mfrow=c(2,3))
	plot(p1,col='blue',border='blue',ylim=c(0,2.5));plot(p2,col='black',add=TRUE,pch=16)
	title(paste("Touches:",gTouches(p1,p2)))
	
	plot(p1,col='blue',border='blue',ylim=c(0,2.5));plot(p3,col='black',add=TRUE,pch=16)
	title(paste("Touches:",gTouches(p1,p3)))
	
	plot(p1,col='blue',border='blue',ylim=c(0,2.5));plot(p4,col='black',add=TRUE,pch=16)
	title(paste("Touches:",gTouches(p1,p4)))
	
	plot(p1,col='blue',border='blue',ylim=c(0,2.5));plot(l0,lwd=2,col='black',add=TRUE,pch=16)
	title(paste("Touches:",gTouches(p1,l0)))
	
	plot(l1,lwd=2,col='blue');plot(l2,lwd=2,col='black',add=TRUE,pch=16)
	title(paste("Touches:",gTouches(l1,l2)))
	
	plot(l1,lwd=2,col='blue');plot(l3,lwd=2,col='black',add=TRUE,pch=16)
	title(paste("Touches:",gTouches(l1,l3)))
	



