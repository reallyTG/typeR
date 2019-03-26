library(tidygraph)


### Name: map_dfs
### Title: Apply a function to nodes in the order of a depth first search
### Aliases: map_dfs map_dfs_lgl map_dfs_chr map_dfs_int map_dfs_dbl

### ** Examples

# Add a random integer to the last value along a search
create_tree(40, children = 3, directed = TRUE) %>%
  mutate(child_acc = map_dfs_int(node_is_root(), .f = function(node, path, ...) {
    last_val <- if (nrow(path) == 0) 0L else tail(unlist(path$result), 1)
    last_val + sample(1:10, 1)
  }))



