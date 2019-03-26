library(igraph)


### Name: layout_with_kk
### Title: The Kamada-Kawai layout algorithm
### Aliases: layout_with_kk with_kk
### Keywords: graphs

### ** Examples


g <- make_ring(10)
E(g)$weight <- rep(1:2, length.out=ecount(g))
plot(g, layout=layout_with_kk, edge.label=E(g)$weight)




