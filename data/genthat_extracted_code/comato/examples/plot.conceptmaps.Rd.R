library(comato)


### Name: plot.conceptmaps
### Title: Plotting a series of concept maps
### Aliases: plot.conceptmaps

### ** Examples

#Create concept maps from three random graphs
require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
g2 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
g3 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
E(g1)$name <- rep("", length(E(g1)))
E(g2)$name <- rep("", length(E(g2)))
E(g3)$name <- rep("", length(E(g3)))
#Create conceptmaps object from three conceptmap objects
simple_cms = conceptmaps(list(conceptmap(g1), conceptmap(g2), conceptmap(g3)))

plot(simple_cms, layout="spring")



