library(sigmajs)


### Name: sg_nodes
### Title: Add nodes and edges
### Aliases: sg_nodes sg_edges sg_edges2 sg_nodes2

### ** Examples

nodes <- sg_make_nodes()
edges <- sg_make_edges(nodes)

sigmajs() %>%
  sg_nodes(nodes, id, label, size, color) %>%
  sg_edges(edges, id, source, target) 

# directed graph
edges$type <- "arrow" # directed

# omit color
sigmajs() %>%
  sg_nodes(nodes, id, label, size) %>%
  sg_edges(edges, id, source, target, type) %>% 
  sg_settings(defaultNodeColor = "#141414")
  
# all source and target are present in node ids
all(c(edges$source, edges$target) %in% nodes$id)




