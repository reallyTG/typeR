library(DiagrammeR)


### Name: get_graph_info
### Title: Get metrics for a graph
### Aliases: get_graph_info

### ** Examples

## Not run: 
##D # Import a GML graph file available
##D # in the DiagrammeR package
##D karate_club <-
##D   system.file(
##D     "extdata", "karate.gml",
##D     package = "DiagrammeR") %>%
##D   import_graph() %>%
##D   set_graph_name("karate")
##D 
##D # Display a data frame with
##D # graph information
##D karate_club %>%
##D   get_graph_info()
## End(Not run)



