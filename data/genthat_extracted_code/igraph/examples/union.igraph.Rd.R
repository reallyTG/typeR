library(igraph)


### Name: union.igraph
### Title: Union of graphs
### Aliases: union.igraph graph.union %u%
### Keywords: graphs

### ** Examples


## Union of two social networks with overlapping sets of actors
net1 <- graph_from_literal(D-A:B:F:G, A-C-F-A, B-E-G-B, A-B, F-G,
                  H-F:G, H-I-J)
net2 <- graph_from_literal(D-A:F:Y, B-A-X-F-H-Z, F-Y)
print_all(net1 %u% net2)



