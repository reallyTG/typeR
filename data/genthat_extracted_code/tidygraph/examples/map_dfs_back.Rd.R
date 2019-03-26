library(tidygraph)


### Name: map_dfs_back
### Title: Apply a function to nodes in the reverse order of a depth first
###   search
### Aliases: map_dfs_back map_dfs_back_lgl map_dfs_back_chr
###   map_dfs_back_int map_dfs_back_dbl

### ** Examples

# Collect values from the 2 closest layers of children in a dfs search
create_tree(40, children = 3, directed = TRUE) %>%
  mutate(value = round(runif(40)*100)) %>%
  mutate(child_acc = map_dfs_back(node_is_root(), .f = function(node, path, dist, ...) {
    if (nrow(path) == 0) .N()$value[node]
    else {
      unlist(path$result[path$dist - dist <= 2])
    }
  }))



