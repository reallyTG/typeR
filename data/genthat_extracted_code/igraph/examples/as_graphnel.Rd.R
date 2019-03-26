library(igraph)


### Name: as_graphnel
### Title: Convert igraph graphs to graphNEL objects from the graph package
### Aliases: as_graphnel igraph.to.graphNEL

### ** Examples

## Undirected
## Not run: 
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



