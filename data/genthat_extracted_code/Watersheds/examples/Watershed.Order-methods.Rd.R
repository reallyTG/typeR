library(Watersheds)


### Name: Watershed.Order-methods
### Title: S4 Method for Function 'Watershed.Order'
### Aliases: Watershed.Order-methods Watershed.Order,Watershed-method
###   Watershed.Order Watershed.Order-class
### Keywords: methods Watershed.Order

### ** Examples

library(Watersheds)
data(WatershedsData)

station1 = WatershedsData$station
subbasin1 = WatershedsData$subbasin
zhyd1 = WatershedsData$zhyd
river1 = WatershedsData$river
node1 = WatershedsData$node	


station1 = SpatialPoints(coords=cbind(4328448.74, 3118576.86), 
	proj4string=slot(subbasin1,"proj4string"))
watershed = new("Watershed",station=station1,subbasin=subbasin1,
	zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)

a = Watershed.Order(watershed)
c1 = a[[1]]
c1_inlet = a[[2]]
c1_outlet = a[[3]]
c2 = a[[4]]
c3 = a[[5]]
node_trib = a[[6]]
sb1 = a[[7]]
riverIO = a[[8]]
nodeIO = a[[9]]			
c1_river = a[[10]]
c1_node = a[[11]]	

bbox1 = slot(c1, "bbox")
bbox = matrix(0,2,2)
bbox[,1] = bbox1[,1]*.998
bbox[,2] = bbox1[,2]*1.002

plot(c1, xlim=bbox[1,], ylim=bbox[2,],col="gray50")			
plot(c2, col="gray75", add=TRUE)
plot(c3, col="gray85", add=TRUE)
plot(slot(watershed,"station"),pch=24, bg="blue",add= TRUE)
plot.PolyLineAttribute(c1, "order", 450, 0.8)
plot.PolyLineAttribute(c2, "order", 450, 0.8)
plot.PolyLineAttribute(c3, "order", 450, 0.8)				
plot(c1_river, col="blue", add=TRUE)
plot(c1_node,pch=21,bg="blue",cex=.5,add=TRUE)
plot(nodeIO,pch=21,bg="blue",cex=.5,add=TRUE)
plot(c1_inlet, pch=21, bg="green",add= TRUE)
plot(c1_outlet,pch=21, bg="red",add= TRUE)
plot.PointAttribute(nodeIO,"ELEV",600,0.7)
title(main="Current zhyd watershed (1)",
	sub="First order tributary watersheds (1.1, 1.2)")



