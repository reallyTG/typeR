library(tidygraph)


### Name: map_bfs_back
### Title: Apply a function to nodes in the reverse order of a breath first
###   search
### Aliases: map_bfs_back map_bfs_back_lgl map_bfs_back_chr
###   map_bfs_back_int map_bfs_back_dbl

### ** Examples

# Collect values from children
create_tree(40, children = 3, directed = TRUE) %>%
  mutate(value = round(runif(40)*100)) %>%
  mutate(child_acc = map_bfs_back_dbl(node_is_root(), .f = function(node, path, ...) {
    if (nrow(path) == 0) .N()$value[node]
    else {
      sum(unlist(path$result[path$parent == node]))
    }
  }))



