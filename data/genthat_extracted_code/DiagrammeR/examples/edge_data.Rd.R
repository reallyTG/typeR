library(DiagrammeR)


### Name: edge_data
### Title: Insert edge data attributes during edge creation
### Aliases: edge_data

### ** Examples

## Not run: 
##D # Create a new graph and add
##D # a path with several edge
##D # data attributes
##D graph <-
##D   create_graph() %>%
##D   add_path(
##D     n = 3,
##D     type = "path",
##D     edge_data = edge_data(
##D       hour = 5,
##D       index = c(1, 2)))
##D 
##D # View the graph's internal
##D # edge data frame; the edge
##D # data attributes have
##D # been inserted
##D graph %>%
##D   get_edge_df()
## End(Not run)



