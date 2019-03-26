library(GISTools)


### Name: GISTools-package
### Title: GISTools
### Aliases: GISTools-package GISTools

### ** Examples

# Load up the libraries needed
library(maptools)
library(RColorBrewer)
# Read in map data and compute a rate for mapping
sids <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], 
	proj4string=CRS("+proj=longlat +ellps=clrk66"))
sids.rate=10000*sids$SID74/sids$BIR74
# Create the shading scheme,  plot a choropleth map and add a legend
shades = auto.shading(sids.rate)
choropleth(sids,sids.rate,shades)
choro.legend(-83.77,37.87,shades,fmt="%4.1f",title='Rate per 10,000')



