library(leafletR)


### Name: leafletR-package
### Title: Interactive Web-Maps Based on the Leaflet JavaScript Library
### Aliases: leafletR-package leafletR
### Keywords: package

### ** Examples

# load example data (Fiji Earthquakes)
data(quakes)

# store data in GeoJSON file (just a subset here)
q.dat <- toGeoJSON(data=quakes[1:99,], dest=tempdir(), name="quakes")

# make style based on quake magnitude
q.style <- styleGrad(prop="mag", breaks=seq(4, 6.5, by=0.5), 
  style.val=rev(heat.colors(5)), leg="Richter Magnitude", 
  fill.alpha=0.7, rad=8)

# create map
q.map <- leaflet(data=q.dat, dest=tempdir(), title="Fiji Earthquakes", 
  base.map="mqsat", style=q.style, popup="mag")

# view map in browser
#q.map



