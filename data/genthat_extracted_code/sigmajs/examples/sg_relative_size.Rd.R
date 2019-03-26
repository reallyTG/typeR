library(sigmajs)


### Name: sg_relative_size
### Title: Relative node sizes
### Aliases: sg_relative_size

### ** Examples

nodes <- sg_make_nodes(50)
edges <- sg_make_edges(nodes, 100)

sigmajs() %>%
  sg_nodes(nodes, id, label) %>% # no need to pass size
  sg_edges(edges, id, source, target) %>% 
  sg_relative_size()




