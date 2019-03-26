library(igraph)


### Name: girth
### Title: Girth of a graph
### Aliases: girth
### Keywords: graphs

### ** Examples


# No circle in a tree
g <- make_tree(1000, 3)
girth(g)

# The worst case running time is for a ring
g <- make_ring(100)
girth(g)

# What about a random graph?
g <- sample_gnp(1000, 1/1000)
girth(g)




