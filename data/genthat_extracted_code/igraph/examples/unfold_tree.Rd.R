library(igraph)


### Name: unfold_tree
### Title: Convert a general graph into a forest
### Aliases: unfold_tree unfold.tree
### Keywords: graphs

### ** Examples


g <- make_tree(10) %du% make_tree(10)
V(g)$id <- seq_len(vcount(g))-1
roots <- sapply(decompose(g), function(x) {
            V(x)$id[ topo_sort(x)[1]+1 ] })
tree <- unfold_tree(g, roots=roots)




