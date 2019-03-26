library(snowboot)


### Name: vertboot
### Title: Bootstrapping a Network with Vertex Bootstrap
### Aliases: vertboot

### ** Examples

graph_ex <- igraph::graph_from_edgelist(artificial_networks[[1]]$edges)
m1 <- igraph::as_adjacency_matrix(graph_ex)
m1 <- as.matrix(m1)
vertboot_out <- vertboot(m1, 20)



