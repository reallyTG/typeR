library(rgeos)


### Name: gRelate
### Title: Geometry Relationships - Intersection Matrix Pattern (DE-9IM)
### Aliases: gRelate RGEOSRelate
### Keywords: spatial

### ** Examples

	x = readWKT("POLYGON((1 0,0 1,1 2,2 1,1 0))")
	x.inter = x
	x.bound = gBoundary(x)
	
	y = readWKT("POLYGON((2 0,1 1,2 2,3 1,2 0))")
	y.inter = y
	y.bound = gBoundary(y)
	
	
	xy.inter = gIntersection(x,y)
	xy.inter.bound = gBoundary(xy.inter)
	
	xy.union = gUnion(x,y)
	bbox = gBuffer(gEnvelope(xy.union),width=0.5,joinStyle='mitre',mitreLimit=3)

	x.exter = gDifference(bbox,x)
	y.exter = gDifference(bbox,y)

	# geometry decomposition
	par(mfrow=c(2,3))
	plot(bbox,border='grey');plot(x,col="black",add=TRUE);title("Interior",ylab = "Polygon X")
	plot(bbox,border='grey');plot(x.bound,col="black",add=TRUE);title("Boundary")
	plot(bbox,border='grey');plot(x.exter,col="black",pbg='white',add=TRUE);title("Exterior")
	plot(bbox,border='grey');plot(y,col="black",add=TRUE);title(ylab = "Polygon Y")
	plot(bbox,border='grey');plot(y.bound,col="black",add=TRUE)
	plot(bbox,border='grey');plot(y.exter,col="black",pbg='white',add=TRUE)
	
	
	
	defaultplot = function() {
		plot(bbox,border='grey')
		plot(x,add=TRUE,col='red1',border="red3")
		plot(y,add=TRUE,col='blue1',border="blue3")		
		plot(xy.inter,add=TRUE,col='orange1',border="orange3")
	}
	
	# Dimensionally Extended 9-Intersection Matrix
	pat = gRelate(x,y)
	patchars = strsplit(pat,"")[[1]]
	
	par(mfrow=c(3,3))
	defaultplot(); plot(gIntersection(x.inter,y.inter),add=TRUE,col='black')
	title(paste("dim:",patchars[1]))
	defaultplot(); plot(gIntersection(x.bound,y.inter),add=TRUE,col='black',lwd=2)
	title(paste("dim:",patchars[2]))
	defaultplot(); plot(gIntersection(x.exter,y.inter),add=TRUE,col='black')
	title(paste("dim:",patchars[3]))
	
	defaultplot(); plot(gIntersection(x.inter,y.bound),add=TRUE,col='black',lwd=2)
	title(paste("dim:",patchars[4]))
	defaultplot(); plot(gIntersection(x.bound,y.bound),add=TRUE,col='black',pch=16)
	title(paste("dim:",patchars[5]))
	defaultplot(); plot(gIntersection(x.exter,y.bound),add=TRUE,col='black',lwd=2)
	title(paste("dim:",patchars[6]))
	
	defaultplot(); plot(gIntersection(x.inter,y.exter),add=TRUE,col='black')
	title(paste("dim:",patchars[7]))
	defaultplot(); plot(gIntersection(x.bound,y.exter),add=TRUE,col='black',lwd=2)
	title(paste("dim:",patchars[8]))
	defaultplot(); plot(gIntersection(x.exter,y.exter),add=TRUE,col='black')
	title(paste("dim:",patchars[9]))
	



