library(tidytree)


### Name: as.treedata
### Title: as.treedata
### Aliases: as.treedata as.treedata.tbl_tree

### ** Examples

library(ape)
set.seed(2017)
tree <- rtree(4)
d <- tibble(label = paste0('t', 1:4),
           trait = rnorm(4))
x <- as_tibble(tree)
full_join(x, d, by = 'label') %>% as.treedata



