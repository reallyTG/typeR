library(comato)


### Name: pathfinder.conceptmaps
### Title: Creating a Pathfinder network from a conceptmaps object
### Aliases: pathfinder.conceptmaps

### ** Examples

#Create concept maps from three random graphs
require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
g2 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
g3 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)

#Create conceptmaps object from three conceptmap objects
simple_cms = conceptmaps(list(conceptmap(g1), conceptmap(g2), conceptmap(g3)))

#Create Pathfinder network from data and return a conceptmap object
cm = pathfinder(simple_cms, q=1, return.cm=TRUE)



