library(igraph)


### Name: graph_from_graphnel
### Title: Convert graphNEL objects from the graph package to igraph
### Aliases: graph_from_graphnel igraph.from.graphNEL

### ** Examples

## Not run: 
##D ## Undirected
##D g <- make_ring(10)
##D V(g)$name <- letters[1:10]
##D GNEL <- as_graphnel(g)
##D g2 <- graph_from_graphnel(GNEL)
##D g2
##D 
##D ## Directed
##D g3 <- make_star(10, mode="in")
##D V(g3)$name <- letters[1:10]
##D GNEL2 <- as_graphnel(g3)
##D g4 <- graph_from_graphnel(GNEL2)
##D g4
## End(Not run)



