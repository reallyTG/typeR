library(Watersheds)


### Name: Watershed
### Title: Class '"Watershed"'
### Aliases: Watershed-class Watershed
### Keywords: classes Watershed

### ** Examples

	data(WatershedsData)
	station1 = WatershedsData$station
	subbasin1 = WatershedsData$subbasin
	zhyd1 = WatershedsData$zhyd
	river1 = WatershedsData$river
	node1 = WatershedsData$node	
	
	station1 = SpatialPoints(coords=slot(station1,"coords"), 
		proj4string=slot(subbasin1,"proj4string"))
	watershed = new("Watershed",station=station1,subbasin=subbasin1,
		zhyd=zhyd1,river=river1,c1=subbasin1,node=node1)



