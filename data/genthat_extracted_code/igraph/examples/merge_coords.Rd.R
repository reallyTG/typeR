library(igraph)


### Name: merge_coords
### Title: Merging graph layouts
### Aliases: merge_coords layout.merge piecewise.layout layout_components
###   piecewise.layout
### Keywords: graphs

### ** Examples


# create 20 scale-free graphs and place them in a common layout
graphs <- lapply(sample(5:20, 20, replace=TRUE),
          barabasi.game, directed=FALSE)
layouts <- lapply(graphs, layout_with_kk)
lay <- merge_coords(graphs, layouts)
g <- disjoint_union(graphs)
## Not run: plot(g, layout=lay, vertex.size=3, labels=NA, edge.color="black")



