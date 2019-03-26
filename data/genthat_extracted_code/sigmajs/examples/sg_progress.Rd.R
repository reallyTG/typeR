library(sigmajs)


### Name: sg_progress
### Title: Text
### Aliases: sg_progress

### ** Examples

# initial nodes
nodes <- sg_make_nodes()

# additional nodes
nodes2 <- sg_make_nodes()
nodes2$id <- as.character(seq(11, 20))

# add delay
nodes2$delay <- runif(nrow(nodes2), 500, 1000)
nodes2$text <- seq.Date(Sys.Date(), Sys.Date() + 9, "days")

sigmajs() %>%
  sg_nodes(nodes, id, label, size, color) %>%
  sg_add_nodes(nodes2, delay, id, label, size, color) %>% 
  sg_progress(nodes2, delay, text, element = "h3") %>%
  sg_button(c("add_nodes", "progress"), "add") 




