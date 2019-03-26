library(dendextend)


### Name: which_node
### Title: Which node id is common to a group of labels
### Aliases: which_node

### ** Examples


dend <- iris[1:10,-5] %>% dist %>% hclust %>% as.dendrogram %>% set("labels", 1:10)
dend %>% plot

which_node(dend, c(1,2), max_id = FALSE)
which_node(dend, c(2,3), max_id = FALSE)
which_node(dend, c(2,3))

dend %>% plot
the_h <- get_nodes_attr(dend, "height", which_node(dend, c(4,6)))
the_h
abline(h = the_h, lty = 2, col = 2)
get_nodes_attr(dend, "height", which_node(dend, c(4,6)))
get_nodes_attr(dend, "members", which_node(dend, c(4,6)))





