library(igraph)


### Name: vertex_attr<-
### Title: Set one or more vertex attributes
### Aliases: vertex_attr<- vertex.attributes<-

### ** Examples

g <- make_ring(10)
vertex_attr(g) <- list(name = LETTERS[1:10],
                        color = rep("yellow", gorder(g)))
vertex_attr(g, "label") <- V(g)$name
g
plot(g)



