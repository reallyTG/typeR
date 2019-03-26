library(igraph)


### Name: layout_on_grid
### Title: Simple grid layout
### Aliases: layout_on_grid layout.grid layout.grid.3d on_grid
###   layout.grid.3d
### Keywords: graphs

### ** Examples


g <- make_lattice( c(3,3) )
layout_on_grid(g)

g2 <- make_lattice( c(3,3,3) )
layout_on_grid(g2, dim = 3)

## Not run: 
##D plot(g, layout=layout_on_grid)
##D rglplot(g, layout=layout_on_grid(g, dim = 3))
## End(Not run)



