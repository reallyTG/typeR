library(mapmisc)


### Name: map.new
### Title: Start a new map
### Aliases: map.new

### ** Examples


Npoints = 20
myPoints = SpatialPointsDataFrame(
	cbind(runif(Npoints), 51+runif(Npoints)), 
	data=data.frame(y1=c(NA, rnorm(Npoints-1)), 
	y2=c(sample(0:5, Npoints-1,replace=TRUE), NA)),
	proj4string=CRS(
	"+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
	)
)

map.new(myPoints, legendRight=TRUE, mar=c(3,3,0,0), buffer=0.2)
points(myPoints)
legendBreaks('right', list(breaks=1:3, col=1:2))




