library(Watersheds)


### Name: SpDF_Touch
### Title: Touch function for spatial objects
### Aliases: SpDF_Touch
### Keywords: SpDF_Touch Touch

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
riverIO = a[[8]]
nodeIO = a[[9]]			

touch = SpDF_Touch(nodeIO, riverIO)
touch1 = touch[[1]]; touch1



