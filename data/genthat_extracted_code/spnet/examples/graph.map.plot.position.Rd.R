library(spnet)


### Name: graph.map.plot.position
### Title: Plot a map labelled with the ID numbering
### Aliases: graph.map.plot.position
###   graph.map.plot.position,SpatialNetwork-method
###   graph.map.plot.position,SpatialPolygons-method

### ** Examples

## The world map
data(world.map.simplified, package = "spnet")

graph.map.plot.position(world.map.simplified)
graph.map.plot.position(world.map.simplified, cex = 0.4)
graph.map.plot.position(world.map.simplified, label = 'ID ', cex = 0.3)



