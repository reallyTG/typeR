library(GISTools)


### Name: choro.legend
### Title: choro.legend
### Aliases: choro.legend

### ** Examples

# Read in map data and compute a rate for mapping
sids <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
	proj4string=CRS("+proj=longlat +ellps=clrk66"))
sids.rate=10000*sids@data[,10]/sids@data[,9]
# Create the shading scheme,  plot a choropleth map and add a legend
shades = auto.shading(sids.rate)
choropleth(sids,sids.rate,shades)
choro.legend(-83.77,37.87,shades,fmt="%4.1f",cex=0.8,title='Rate per 10,000')



