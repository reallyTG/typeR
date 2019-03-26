library(sigmajs)


### Name: sg_layout
### Title: Layouts
### Aliases: sg_layout sg_get_layout

### ** Examples

nodes <- sg_make_nodes(250) # 250 nodes
edges <- sg_make_edges(nodes, n = 500)

sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_layout()

nodes_coords <- sg_get_layout(nodes, edges)




