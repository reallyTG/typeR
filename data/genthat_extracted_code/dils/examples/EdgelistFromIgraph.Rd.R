library(dils)


### Name: EdgelistFromIgraph
### Title: Convert an igraph to filled edgelist
### Aliases: EdgelistFromIgraph

### ** Examples

g <- erdos.renyi.game(10, 2/10)
EdgelistFromIgraph(g)

V(g)$name <- letters[1:vcount(g)]
EdgelistFromIgraph(g)

E(g)$weight <- runif(ecount(g))
EdgelistFromIgraph(g, useWeight=TRUE)



