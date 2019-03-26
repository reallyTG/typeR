library(intergraph)


### Name: as.matrix.igraph
### Title: Convert igraph objects to adjacency or edge list matrices
### Aliases: as.matrix.igraph

### ** Examples

data(exIgraph)
as.matrix(exIgraph, "adjacency")
as.matrix(exIgraph, "edgelist")
# use edge attribute "label"
as.matrix(exIgraph, "adjacency", sparse=FALSE, attr="label")



