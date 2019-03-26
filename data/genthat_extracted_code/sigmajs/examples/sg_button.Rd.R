library(sigmajs)


### Name: sg_button
### Title: Buttons
### Aliases: sg_button

### ** Examples

nodes <- sg_make_nodes() 
edges <- sg_make_edges(nodes)

# Button starts the layout and stops it after 3 seconds
sigmajs() %>% 
  sg_nodes(nodes, id, size) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_force_start() %>% 
  sg_force_stop(3000) %>% 
  sg_button(c("force_start", "force_stop"), "start layout")
  
# additional nodes
nodes2 <- sg_make_nodes()
nodes2$id <- as.character(seq(11, 20))

# add delay
nodes2$delay <- runif(nrow(nodes2), 500, 1000)

sigmajs() %>%
  sg_nodes(nodes, id, label, size, color) %>%
  sg_add_nodes(nodes2, delay, id, label, size, color) %>% 
  sg_force_start() %>% 
  sg_force_stop(3000) %>% 
  sg_button(c("force_start", "force_stop"), "start layout") %>% 
  sg_button("add_nodes", "add nodes")




