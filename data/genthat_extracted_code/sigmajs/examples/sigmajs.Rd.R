library(sigmajs)


### Name: sigmajs
### Title: Initialise
### Aliases: sigmajs

### ** Examples

nodes <- sg_make_nodes()
edges <- sg_make_edges(nodes)

sigmajs("svg") %>%
  sg_nodes(nodes, id, label, size, color) %>%
  sg_edges(edges, id, source, target) 




