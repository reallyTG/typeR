library(tidygraph)


### Name: map_bfs
### Title: Apply a function to nodes in the order of a breath first search
### Aliases: map_bfs map_bfs_lgl map_bfs_chr map_bfs_int map_bfs_dbl

### ** Examples

# Accumulate values along a search
create_tree(40, children = 3, directed = TRUE) %>%
  mutate(value = round(runif(40)*100)) %>%
  mutate(value_acc = map_bfs_dbl(node_is_root(), .f = function(node, path, ...) {
    sum(.N()$value[c(node, path$node)])
  }))



