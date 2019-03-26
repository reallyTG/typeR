library(BDgraph)


### Name: rgwish
### Title: Sampling from G-Wishart distribution
### Aliases: rgwish

### ** Examples

# Generating a 'circle' graph as a non-decomposable graph
adj.g <- graph.sim( p = 5, graph = "circle" )
adj.g    # adjacency of graph with 5 nodes
  
sample <- rgwish( n = 1, adj.g = adj.g, b = 3, D = diag( 5 ) )
round( sample, 2 ) 

sample <- rgwish( n = 5, adj.g = adj.g )
round( sample, 2 )  



