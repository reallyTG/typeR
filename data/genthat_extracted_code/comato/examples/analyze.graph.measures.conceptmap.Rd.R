library(comato)


### Name: analyze.graph.measures.conceptmap
### Title: Analyzing graph measures of a concept map
### Aliases: analyze.graph.measures.conceptmap

### ** Examples

require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(15, 0.7, type="gnp"), "name", value=1:15)
analyze.graph.measures(conceptmap(g1))



