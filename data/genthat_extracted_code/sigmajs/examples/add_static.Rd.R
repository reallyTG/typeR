library(sigmajs)


### Name: sg_add_nodes
### Title: Add nodes and edges
### Aliases: sg_add_nodes sg_add_edges

### ** Examples

# initial nodes
nodes <- sg_make_nodes()

# additional nodes
nodes2 <- sg_make_nodes()
nodes2$id <- as.character(seq(11, 20))

# add delay
nodes2$delay <- runif(nrow(nodes2), 500, 1000)

sigmajs() %>%
  sg_nodes(nodes, id, label, size, color) %>%
  sg_add_nodes(nodes2, delay, id, label, size, color)
  
edges <- sg_make_edges(nodes, 25)
edges$delay <- runif(nrow(edges), 100, 2000)

sigmajs() %>%
  sg_force_start() %>%
  sg_nodes(nodes, id, label, size, color) %>% 
  sg_add_edges(edges, delay, id, source, target, cumsum = FALSE) %>%
  sg_force_stop(2300) # stop after all edges added




