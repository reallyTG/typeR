library(igraph)


### Name: layout_
### Title: Graph layouts
### Aliases: layout_ layout print.igraph_layout_spec
###   print.igraph_layout_modifier

### ** Examples

g <- make_ring(10) + make_full_graph(5)
coords <- layout_(g, as_star())
plot(g, layout = coords)



