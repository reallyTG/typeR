library(igraph)


### Name: +.igraph
### Title: Add vertices, edges or another graph to a graph
### Aliases: +.igraph

### ** Examples

# 10 vertices named a,b,c,... and no edges
g <- make_empty_graph() + vertices(letters[1:10])

# Add edges to make it a ring
g <- g + path(letters[1:10], letters[1], color = "grey")

# Add some extra random edges
g <- g + edges(sample(V(g), 10, replace = TRUE), color = "red")
g$layout <- layout_in_circle
plot(g)



