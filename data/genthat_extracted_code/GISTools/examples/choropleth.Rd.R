library(GISTools)


### Name: choropleth
### Title: choropleth
### Aliases: choropleth

### ** Examples

# Read in map data and compute a rate for mapping
sids <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
	proj4string=CRS("+proj=longlat +ellps=clrk66"))
sids.rate=10000*sids$SID74/sids$BIR74
# Create the shading scheme,  plot a choropleth map 
shades = auto.shading(sids.rate,cols=brewer.pal(5,'Blues'))
choropleth(sids,sids.rate,shades)



