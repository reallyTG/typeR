library(tidytree)


### Name: ancestor
### Title: ancestor
### Aliases: ancestor ancestor.tbl_tree

### ** Examples

library(ape)
tree <- rtree(4)
x <- as_tibble(tree)
ancestor(x, 3)



