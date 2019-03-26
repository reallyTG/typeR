library(igraph)


### Name: difference.igraph
### Title: Difference of graphs
### Aliases: difference.igraph graph.difference %m%
### Keywords: graphs

### ** Examples


## Create a wheel graph
wheel <- union(make_ring(10),
                     make_star(11, center=11, mode="undirected"))
V(wheel)$name <- letters[seq_len(vcount(wheel))]

## Subtract a star graph from it
sstar <- make_star(6, center=6, mode="undirected")
V(sstar)$name <- letters[c(1,3,5,7,9,11)]
G <- wheel %m% sstar
print_all(G)
plot(G, layout=layout_nicely(wheel))



