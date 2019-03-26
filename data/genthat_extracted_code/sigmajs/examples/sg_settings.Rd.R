library(sigmajs)


### Name: sg_settings
### Title: Settings
### Aliases: sg_settings

### ** Examples

nodes <- sg_make_nodes()

edges <- sg_make_edges(nodes, 50)

sigmajs() %>%
  sg_nodes(nodes, id, label, size) %>%
  sg_edges(edges, id, source, target) %>% 
  sg_force() %>% 
  sg_settings(
    defaultNodeColor = "#0011ff"
  )




