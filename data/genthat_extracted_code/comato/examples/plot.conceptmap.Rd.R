library(comato)


### Name: plot.conceptmap
### Title: Plotting a conceptmap
### Aliases: plot.conceptmap

### ** Examples

#Create concept map from a random graph
require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
E(g1)$name <- rep("", length(E(g1)))
plot(conceptmap(g1), edge.labels=FALSE, layout="kamada.kawai")



