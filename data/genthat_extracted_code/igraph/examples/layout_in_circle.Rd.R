library(igraph)


### Name: layout_in_circle
### Title: Graph layout with vertices on a circle.
### Aliases: layout_in_circle in_circle
### Keywords: graphs

### ** Examples


## Place vertices on a circle, order them according to their
## community
## Not run: 
##D library(igraphdata)
##D data(karate)
##D karate_groups <- cluster_optimal(karate)
##D coords <- layout_in_circle(karate, order =
##D           order(membership(karate_groups)))
##D V(karate)$label <- sub("Actor ", "", V(karate)$name)
##D V(karate)$label.color <- membership(karate_groups)
##D V(karate)$shape <- "none"
##D plot(karate, layout = coords)
## End(Not run)



