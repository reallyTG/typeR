library(sigmajs)


### Name: sg_noverlap
### Title: No overlap
### Aliases: sg_noverlap sg_noverlap_p

### ** Examples

nodes <- sg_make_nodes(500)
edges <- sg_make_edges(nodes)

sigmajs() %>%
  sg_nodes(nodes, id, size, color) %>%
  sg_edges(edges, id, source, target) %>%
  sg_layout() %>% 
  sg_noverlap()




