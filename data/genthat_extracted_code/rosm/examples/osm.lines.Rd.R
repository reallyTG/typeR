library(rosm)


### Name: osm.lines
### Title: Overlay lines on an OSM plot
### Aliases: osm.lines

### ** Examples

## No test: 
library(rosm)
library(prettymapr)
locs <- geocode(c("wolfville, ns", "kentville, ns", "halifax, ns"))
prettymap({
  osm.plot(searchbbox("nova scotia"))
  osm.lines(locs$lon, locs$lat, lwd=2)
})
## End(No test)




