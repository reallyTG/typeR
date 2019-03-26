library(igraph)


### Name: edge_attr<-
### Title: Set one or more edge attributes
### Aliases: edge_attr<- edge.attributes<-

### ** Examples

g <- make_ring(10)
edge_attr(g) <- list(name = LETTERS[1:10],
                      color = rep("green", gsize(g)))
edge_attr(g, "label") <- E(g)$name
g
plot(g)



