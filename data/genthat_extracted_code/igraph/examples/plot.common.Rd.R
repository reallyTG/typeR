library(igraph)


### Name: Drawing graphs
### Title: Drawing graphs
### Aliases: igraph.plotting
### Keywords: graphs

### ** Examples

## Not run: 
##D 
##D # plotting a simple ring graph, all default parameters, except the layout
##D g <- make_ring(10)
##D g$layout <- layout_in_circle
##D plot(g)
##D tkplot(g)
##D rglplot(g)
##D 
##D # plotting a random graph, set the parameters in the command arguments
##D g <- barabasi.game(100)
##D plot(g, layout=layout_with_fr, vertex.size=4,
##D      vertex.label.dist=0.5, vertex.color="red", edge.arrow.size=0.5)
##D 
##D # plot a random graph, different color for each component
##D g <- sample_gnp(100, 1/100)
##D comps <- components(g)$membership
##D colbar <- rainbow(max(comps)+1)
##D V(g)$color <- colbar[comps+1]
##D plot(g, layout=layout_with_fr, vertex.size=5, vertex.label=NA)
##D 
##D # plot communities in a graph
##D g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
##D g <- add_edges(g, c(1,6, 1,11, 6,11))
##D com <- cluster_spinglass(g, spins=5)
##D V(g)$color <- com$membership+1
##D g <- set_graph_attr(g, "layout", layout_with_kk(g))
##D plot(g, vertex.label.dist=1.5)
##D 
##D # draw a bunch of trees, fix layout
##D igraph_options(plot.layout=layout_as_tree)
##D plot(make_tree(20, 2))
##D plot(make_tree(50, 3), vertex.size=3, vertex.label=NA)
##D tkplot(make_tree(50, 2, mode="undirected"), vertex.size=10,
##D vertex.color="green")
## End(Not run)



