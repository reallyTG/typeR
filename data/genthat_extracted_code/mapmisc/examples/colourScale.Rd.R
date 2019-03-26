library(mapmisc)


### Name: colourScale
### Title: Create colour scales
### Aliases: colourScale colorScale breaksForRates

### ** Examples


breaksForRates(13.6, breaks = 7) 

Npoints = 20
myPoints = SpatialPointsDataFrame(20*cbind(runif(Npoints), runif(Npoints)), 
	data=data.frame(y1=c(NA, rnorm(Npoints-1)), 
	y2=c(sample(1:4, Npoints-1,replace=TRUE), NA)),
	proj4string=CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
	)

## Not run: 
##D mymap = openmap(myPoints)
## End(Not run)

if(require('RColorBrewer', quietly=TRUE)) {
	theCol = 'RdYlBu'
} else {
	theCol = heat.colors
}

myscale = colourScale(myPoints$y1, breaks=4, col=theCol,
 style="quantile", revCol=TRUE,dec=1)



map.new(myPoints)
## Not run: 
##D plot(mymap,add=TRUE)
## End(Not run)
plot(myPoints, col=myscale$plot, pch=16,add=TRUE)
legendBreaks("topleft", breaks=myscale)


myscale2 = colourScale(myPoints$y1, breaks=8, col=rainbow, style="equal",
opacity=0.8, dec=2, revCol=TRUE)

map.new(myPoints)
## Not run: 
##D plot(mymap,add=TRUE)
## End(Not run)
plot(myPoints, col=myscale2$plot, pch=16,add=TRUE)
legendBreaks("topleft", breaks=myscale2)

if(require('RColorBrewer', quietly=TRUE)) {
	theCol = 'Set2'
} else {
	theCol = heat.colors
}

myscale3 = colourScale(myPoints$y2,  breaks=3,col=theCol, style="unique",
	opacity=c(0.1, 0.9))

map.new(myPoints)
## Not run: 
##D plot(mymap,add=TRUE)
## End(Not run)
plot(myPoints, col=myscale3$plot, pch=16,add=TRUE)
legendBreaks("topleft", breaks=myscale3)

myPoints$y3 = exp(myPoints$y1)
myscale4 = colourScale(myPoints$y3,  breaks=4, style="equal",
	opacity=c(0.1, 0.9), transform=1.25,dec=0, firstBreak=0)

map.new(myPoints)
## Not run: 
##D plot(mymap,add=TRUE)
## End(Not run)
plot(myPoints, col=myscale4$plot, pch=16,add=TRUE)
legendBreaks("topleft", legend=myscale4$breaks, col=myscale4$col)




