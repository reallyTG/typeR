library(igraph)


### Name: graph_
### Title: Convert object to a graph
### Aliases: graph_

### ** Examples

## These are equivalent
graph_(cbind(1:5,2:6), from_edgelist(directed = FALSE))
graph_(cbind(1:5,2:6), from_edgelist(), directed = FALSE)



