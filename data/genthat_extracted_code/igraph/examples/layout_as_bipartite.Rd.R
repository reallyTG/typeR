library(igraph)


### Name: layout_as_bipartite
### Title: Simple two-row layout for bipartite graphs
### Aliases: layout_as_bipartite layout.bipartite as_bipartite
### Keywords: graphs

### ** Examples

# Random bipartite graph
inc <- matrix(sample(0:1, 50, replace = TRUE, prob=c(2,1)), 10, 5)
g <- graph_from_incidence_matrix(inc)
plot(g, layout = layout_as_bipartite,
     vertex.color=c("green","cyan")[V(g)$type+1])

# Two columns
g %>%
  add_layout_(as_bipartite()) %>%
  plot()



