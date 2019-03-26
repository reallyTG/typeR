library(sigmajs)


### Name: sg_neighbours
### Title: Highlight neighbours
### Aliases: sg_neighbours sg_neighbors

### ** Examples

nodes <- sg_make_nodes() 
edges <- sg_make_edges(nodes, 17)

sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_layout() %>% 
  sg_neighbours()




