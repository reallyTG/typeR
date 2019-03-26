library(rosm)


### Name: osm.segments
### Title: Overlay segments on an OSM plot
### Aliases: osm.segments

### ** Examples

## No test: 
library(rosm)
library(prettymapr)
locs <- geocode(c("wolfville, ns", "kentville, ns", "halifax, ns"))
prettymap({
  osm.plot(searchbbox("nova scotia"))
  osm.segments(locs$lon[1:2], locs$lat[1:2], locs$lon[2:3], locs$lat[2:3])
})
## End(No test)




