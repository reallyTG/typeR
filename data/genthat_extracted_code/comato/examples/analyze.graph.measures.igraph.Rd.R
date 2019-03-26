library(comato)


### Name: analyze.graph.measures.igraph
### Title: Analyzing graph measures of an igraph object
### Aliases: analyze.graph.measures.igraph

### ** Examples

require("igraph")
g1 = set.vertex.attribute(erdos.renyi.game(15, 0.7, type="gnp"), "name", value=1:15)
analyze.graph.measures(g1)



