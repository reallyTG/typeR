library(igraph)


### Name: dominator_tree
### Title: Dominator tree
### Aliases: dominator_tree dominator.tree
### Keywords: graphs

### ** Examples


## The example from the paper
g <- graph_from_literal(R-+A:B:C, A-+D, B-+A:D:E, C-+F:G, D-+L,
               E-+H, F-+I, G-+I:J, H-+E:K, I-+K, J-+I,
               K-+I:R, L-+H)
dtree <- dominator_tree(g, root="R")
layout <- layout_as_tree(dtree$domtree, root="R")
layout[,2] <- -layout[,2]
plot(dtree$domtree, layout=layout, vertex.label=V(dtree$domtree)$name)



