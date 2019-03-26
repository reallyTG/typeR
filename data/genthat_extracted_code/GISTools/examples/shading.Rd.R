library(GISTools)


### Name: shading
### Title: Shading
### Aliases: shading

### ** Examples

# Read in map data and compute a rate for mapping
sids <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
	proj4string=CRS("+proj=longlat +ellps=clrk66"))
sids.rate=10000*sids@data[,10]/sids@data[,9]
shades = shading(breaks=c(15,30,45,60,75),cols=brewer.pal(6,'YlGn'))
choropleth(sids,sids.rate,shades)
choro.legend(-83.77,37.87,shades,fmt="%4.0f",title='Rate per 10,000')



