library(sigmajs)


### Name: sg_drag_nodes
### Title: Drag nodes
### Aliases: sg_drag_nodes sg_drag_nodes_start_p sg_drag_nodes_kill_p

### ** Examples

# generate graph
nodes <- sg_make_nodes(20)
edges <- sg_make_edges(nodes, 35)

sigmajs() %>%
  sg_nodes(nodes, id, label, size) %>%
  sg_edges(edges, id, source, target) %>%
  sg_drag_nodes()

## Not run: 
##D # proxies
##D demo("drag-nodes", package = "sigmajs")
## End(Not run)




