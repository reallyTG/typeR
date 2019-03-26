library(DiagrammeR)


### Name: visnetwork
### Title: Render graph with visNetwork
### Aliases: visnetwork

### ** Examples

## Not run: 
##D # Create a node data frame (ndf)
##D ndf <-
##D   create_node_df(
##D     n = 6,
##D     label = TRUE,
##D     fillcolor = c("lightgrey", "red", "orange",
##D                   "pink", "aqua", "yellow"),
##D     shape = "dot",
##D     size = c(20, 80, 40, 10, 30, 50),
##D     type = c("1", "1", "1", "2", "2", "2"))
##D 
##D # Create an edge data frame (edf)
##D edf <-
##D   create_edge_df(
##D     from = c(1, 2, 3, 4, 6, 5),
##D     to = c(4, 3, 1, 3, 1, 4),
##D     color = c("green", "green", "grey",
##D               "grey", "blue", "blue"),
##D     rel = "leading_to")
##D 
##D # Create a graph object
##D graph <-
##D   create_graph(
##D     nodes_df = ndf,
##D     edges_df = edf)
##D 
##D visnetwork(graph)
## End(Not run)



