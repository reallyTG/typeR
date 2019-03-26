library(sigmajs)


### Name: sg_make_nodes
### Title: Generate data
### Aliases: sg_make_nodes sg_make_edges sg_make_nodes_edges

### ** Examples

nodes <- sg_make_nodes()
edges <- sg_make_edges(nodes)

sigmajs() %>%
sg_nodes(nodes, id, label, size, color) %>%
sg_edges(edges, id, source, target) %>%
sg_settings(defaultNodeColor = "#0011ff")




