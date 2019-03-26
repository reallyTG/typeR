library(igraph)


### Name: intersection.igraph
### Title: Intersection of graphs
### Aliases: intersection.igraph graph.intersection %s%
### Keywords: graphs

### ** Examples


## Common part of two social networks
net1 <- graph_from_literal(D-A:B:F:G, A-C-F-A, B-E-G-B, A-B, F-G,
                  H-F:G, H-I-J)
net2 <- graph_from_literal(D-A:F:Y, B-A-X-F-H-Z, F-Y)
print_all(net1 %s% net2)



