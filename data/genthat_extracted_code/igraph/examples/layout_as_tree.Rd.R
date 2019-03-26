library(igraph)


### Name: layout_as_tree
### Title: The Reingold-Tilford graph layout algorithm
### Aliases: layout_as_tree as_tree
### Keywords: graphs

### ** Examples


tree <- make_tree(20, 3)
plot(tree, layout=layout_as_tree)
plot(tree, layout=layout_as_tree(tree, flip.y=FALSE))
plot(tree, layout=layout_as_tree(tree, circular=TRUE))

tree2 <- make_tree(10, 3) + make_tree(10, 2)
plot(tree2, layout=layout_as_tree)
plot(tree2, layout=layout_as_tree(tree2, root=c(1,11),
                                           rootlevel=c(2,1)))



