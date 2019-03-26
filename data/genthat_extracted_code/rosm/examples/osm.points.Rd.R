library(rosm)


### Name: osm.points
### Title: Overlay points on an OSM plot
### Aliases: osm.points

### ** Examples

## No test: 
library(rosm)
library(prettymapr)
locs <- geocode(c("wolfville, ns", "kentville, ns", "halifax, ns"))
prettymap({
  osm.plot(searchbbox("nova scotia"))
  osm.points(locs$lon, locs$lat, pch=18, cex=0.7)
})
## End(No test)




