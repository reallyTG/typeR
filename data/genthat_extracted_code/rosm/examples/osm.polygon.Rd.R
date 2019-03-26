library(rosm)


### Name: osm.polygon
### Title: Overlay a polygon on an OSM plot
### Aliases: osm.polygon

### ** Examples

## No test: 
library(rosm)
library(prettymapr)
locs <- geocode(c("wolfville, ns", "kentville, ns", "halifax, ns"))
prettymap({
  osm.plot(searchbbox("nova scotia"))
  osm.polygon(locs$lon, locs$lat)
})
## End(No test)




