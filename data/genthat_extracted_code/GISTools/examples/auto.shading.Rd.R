library(GISTools)


### Name: auto.shading
### Title: auto.shading
### Aliases: auto.shading

### ** Examples

# Read in map data and compute a rate for mapping
sids <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
	proj4string=CRS("+proj=longlat +ellps=clrk66"))
sids.rate=10000*sids$SID74/sids$BIR74
# Create the shading scheme,  plot a choropleth map and add a legend
shades = auto.shading(sids.rate,n=6)
choropleth(sids,sids.rate,shades)
choro.legend(-83.77,37.87,shades,fmt="%4.1f",title='Rate per 10,000')
# Now again with a different set of class intervals and colours
shades = auto.shading(sids.rate,n=6,cutter=rangeCuts,cols=brewer.pal(6,'Greens'))
choropleth(sids,sids.rate,shades)
choro.legend(-83.77,37.87,shades,fmt="%4.1f",title='Rate per 10,000')



