library(comato)


### Name: landscape
### Title: Aggregating the maps of a conceptmaps object into a concept
###   landscape
### Aliases: landscape

### ** Examples

#Create concept maps from three random graphs
require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
g2 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
g3 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)

#Create conceptmaps object from three conceptmap objects
cms = conceptmaps(list(conceptmap(g1), conceptmap(g2), conceptmap(g3)))

landscape(cms, result="graph", mode="undirected")

landscape(cms, result="matrix", mode="concept.vector")



