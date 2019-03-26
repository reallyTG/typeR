library(DiagrammeR)


### Name: import_graph
### Title: Import a graph from various graph formats
### Aliases: import_graph

### ** Examples

## Not run: 
##D # Import a GML graph file
##D gml_graph <-
##D   import_graph(
##D     system.file(
##D       "extdata/karate.gml",
##D       package = "DiagrammeR"))
##D 
##D # Get a count of the graph's nodes
##D gml_graph %>%
##D   count_nodes()
##D 
##D # Get a count of the graph's edges
##D gml_graph %>%
##D   count_edges()
## End(Not run)



