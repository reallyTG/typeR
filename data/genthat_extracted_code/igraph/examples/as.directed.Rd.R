library(igraph)


### Name: as.directed
### Title: Convert between directed and undirected graphs
### Aliases: as.directed as.undirected as.undirected
### Keywords: graphs

### ** Examples


g <- make_ring(10)
as.directed(g, "mutual")
g2 <- make_star(10)
as.undirected(g)

# Combining edge attributes
g3 <- make_ring(10, directed=TRUE, mutual=TRUE)
E(g3)$weight <- seq_len(ecount(g3))
ug3 <- as.undirected(g3)
print(ug3, e=TRUE)
## Not run: 
##D   x11(width=10, height=5)
##D   layout(rbind(1:2))
##D   plot( g3, layout=layout_in_circle, edge.label=E(g3)$weight)
##D   plot(ug3, layout=layout_in_circle, edge.label=E(ug3)$weight)
## End(Not run)

g4 <- graph(c(1,2, 3,2,3,4,3,4, 5,4,5,4,
              6,7, 7,6,7,8,7,8, 8,7,8,9,8,9,
              9,8,9,8,9,9, 10,10,10,10))
E(g4)$weight <- seq_len(ecount(g4))
ug4 <- as.undirected(g4, mode="mutual",
              edge.attr.comb=list(weight=length))
print(ug4, e=TRUE)




