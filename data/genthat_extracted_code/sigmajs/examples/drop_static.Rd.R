library(sigmajs)


### Name: sg_drop_nodes
### Title: Drop
### Aliases: sg_drop_nodes sg_drop_edges

### ** Examples

nodes <- sg_make_nodes(75)

# nodes to drop
nodes2 <- nodes[sample(nrow(nodes), 50), ]
nodes2$delay <- runif(nrow(nodes2), 1000, 3000)

sigmajs() %>% 
  sg_nodes(nodes, id, size, color) %>% 
  sg_drop_nodes(nodes2, id, delay, cumsum = FALSE)




