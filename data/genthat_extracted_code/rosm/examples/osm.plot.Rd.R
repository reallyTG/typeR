library(rosm)


### Name: osm.plot
### Title: Plot Open Street Map Tiles
### Aliases: osm.plot

### ** Examples

## No test: 
library(prettymapr)
ns <- makebbox(47.2, -59.7, 43.3, -66.4)
osm.plot(ns)
osm.plot(ns, type="stamenbw")
prettymap(osm.plot(ns), scale.style="ticks", scale.tick.cex=0)
## End(No test)



