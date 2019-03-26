library(comato)


### Name: conceptmap.igraph
### Title: Creation of a conceptmap object from an existing graph
### Aliases: conceptmap.igraph

### ** Examples

#Create conceptmap from a complete graph with 5 nodes
require("igraph")
graph = graph.full(5)
graph = set.vertex.attribute(graph, "name", value=1:5)
simple_cm = conceptmap(graph)



