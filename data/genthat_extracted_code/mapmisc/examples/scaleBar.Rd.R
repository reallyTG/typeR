library(mapmisc)


### Name: scaleBar
### Title: Scale bar and inset map
### Aliases: scaleBar insetMap

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

## Not run: 
##D mymap = openmap(myPoints)
## End(Not run)

breaks = c(-100, -1, 1, Inf)
thecol = c('red','orange','blue')


map.new(myPoints)
## Not run: 
##D plot(mymap,add=TRUE)
## End(Not run)
plot(myPoints,col = as.character(cut(
	myPoints$y1, breaks, thecol
)),add=TRUE)
scaleBar(myPoints, "bottomright",cex=1.25, seg.len=2)
temp=legendBreaks("topleft", legend=breaks, col=thecol)

## Not run: 
##D thedot = insetMap(myPoints, "bottomleft",col='#00000000', lty=0)
##D points(thedot)
## End(Not run)



