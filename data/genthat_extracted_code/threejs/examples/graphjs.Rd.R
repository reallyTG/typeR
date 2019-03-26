library(threejs)


### Name: graphjs
### Title: Interactive 3D Graph Visualization
### Aliases: graphjs

### ** Examples

set.seed(1)
g <- sample_islands(3, 10, 5/10, 1)
i <- cluster_optimal(g)
(graphjs(g, vertex.color=c("orange", "green", "blue")[i$membership], vertex.shape="sphere"))

# Les Miserables Character Co-appearance Data
data("LeMis")
(graphjs(LeMis))

# ...plot Character names
(graphjs(LeMis, vertex.shape=V(LeMis)$label))

# SNAP Facebook ego network dataset
data("ego")
(graphjs(ego, bg="black"))

## Not run: 
##D # A shiny example
##D shiny::runApp(system.file("examples/graph", package="threejs"))
##D 
##D # A graph amination that shows several layouts
##D data("LeMis")
##D graphjs(LeMis,
##D   layout=list(
##D     layout_randomly(LeMis, dim=3),
##D     layout_on_sphere(LeMis),
##D     layout_with_drl(LeMis, dim=3),  # note! somewhat slow...
##D     layout_with_fr(LeMis, dim=3, niter=30)),
##D   main=list("random layout", "sphere layout", "drl layout", "fr layout"),
##D   fpl=300)
##D 
##D # A simple graph animation illustrating edge modification
##D g <- make_ring(5) - edges(1:5)
##D graph_list <- list(
##D  g + edge(1, 2),
##D  g + edge(1, 2) + edge(2, 3),
##D  g + edge(1, 2) + edge(2, 3) + edge(3, 4),
##D  g + edge(1, 2) + edge(2, 3) + edge(3, 4) + edge(4, 5),
##D  g + edge(1, 2) + edge(2, 3) + edge(3, 4) + edge(4, 5) + edge(5, 1))
##D  graphjs(graph_list, main=paste(1:5),
##D    vertex.color=rainbow(5), vertex.shape="sphere", edge.width=3)
##D 
##D # see `demo(package="threejs") for more animation demos.
##D 
##D # A crosstalk example
##D library(crosstalk)
##D library(DT)
##D data(LeMis)
##D sd = SharedData$new(data.frame(Name = V(LeMis)$label))
##D print(bscols(
##D   graphjs(LeMis, brush=TRUE, crosstalk=sd),
##D   datatable(sd, rownames=FALSE, options=list(dom='tp'))
##D ))
## End(Not run)




