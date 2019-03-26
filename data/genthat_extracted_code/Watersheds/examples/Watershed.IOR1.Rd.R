library(Watersheds)


### Name: Watershed.IOR1
### Title: Watershed inlet and outlet nodes: case 1
### Aliases: Watershed.IOR1
### Keywords: Watershed.IOR1

### ** Examples

library(Watersheds)
data(WatershedsData)

station1 = WatershedsData$station
subbasin1 = WatershedsData$subbasin
zhyd1 = WatershedsData$zhyd
river1 = WatershedsData$river
node1 = WatershedsData$node	

station1 = SpatialPoints(coords=cbind(4232972,3327634), 
	proj4string=slot(subbasin1,"proj4string"))
watershed = new("Watershed",station=station1,subbasin=subbasin1,
	zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)

a = Watershed.Order(watershed)
c1 = a[[1]]
nodeIO = a[[9]]			
c1_river = a[[10]]
		
# determining inlet and outlet watershed nodes
	# determining distances of nodeIO to c1
	boundary = gBoundary(c1)
	dist = gDistance(nodeIO, boundary, byid =TRUE)
	a = Watershed.IOR1(x=nodeIO, dist=dist)
	c1_inlet = a$inlet; c1_inlet
	c1_outlet = a$outlet; c1_outlet
	
plot(c1,col="gray50")			
plot(station1,pch=24, bg="blue",add= TRUE)
plot(c1_river, col="blue", add=TRUE)
plot(c1_outlet,pch=21, bg="red",add= TRUE)
plot.PointAttribute(c1_outlet,"ELEV",700,0.8)
title(main="Watershed outlet, case I")



