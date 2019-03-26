library(sigmajs)


### Name: sg_force
### Title: Add forceAtlas2
### Aliases: sg_force sg_force_start sg_force_stop sg_force_restart_p
###   sg_force_restart sg_force_start_p sg_force_stop_p sg_force_kill_p
###   sg_force_config_p

### ** Examples

nodes <- sg_make_nodes(50)
edges <- sg_make_edges(nodes, 100)

sigmajs() %>%
  sg_nodes(nodes, id, label, size) %>%
  sg_edges(edges, id, source, target) %>% 
  sg_force() %>% 
  sg_force_stop() # stop force after 5 seconds




