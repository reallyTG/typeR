library(DiagrammeR)


### Name: render_graph_from_graph_series
### Title: Render a graph available in a series
### Aliases: render_graph_from_graph_series

### ** Examples

## Not run: 
##D # Create three graphs
##D graph_1 <-
##D   create_graph() %>%
##D   add_path(n = 4)
##D 
##D graph_2 <-
##D   create_graph() %>%
##D   add_cycle(n = 5)
##D 
##D graph_3 <-
##D   create_graph() %>%
##D   add_star(n = 6)
##D 
##D # Create an empty graph series
##D # and add the graphs
##D series <-
##D   create_graph_series() %>%
##D   add_graph_to_graph_series(
##D     graph = graph_1) %>%
##D   add_graph_to_graph_series(
##D     graph = graph_2) %>%
##D   add_graph_to_graph_series(
##D     graph = graph_3)
##D 
##D # View the second graph in
##D # the series in the Viewer
##D render_graph_from_graph_series(
##D   graph_series = series,
##D   graph_no = 2)
## End(Not run)



