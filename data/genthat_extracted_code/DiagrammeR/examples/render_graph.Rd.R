library(DiagrammeR)


### Name: render_graph
### Title: Render the graph in various formats
### Aliases: render_graph

### ** Examples

## Not run: 
##D # Render a graph that's a
##D # balanced tree
##D create_graph() %>%
##D   add_balanced_tree(
##D     k = 2, h = 3) %>%
##D   render_graph()
##D 
##D # Use the `tree` layout for
##D # better node placement in this
##D # hierarchical graph
##D create_graph() %>%
##D   add_balanced_tree(
##D     k = 2, h = 3) %>%
##D   render_graph(layout = "tree")
##D 
##D # Plot the same tree graph but
##D # don't show the node ID values
##D create_graph() %>%
##D   add_balanced_tree(
##D     k = 2, h = 3) %>%
##D   set_node_attr_to_display() %>%
##D   render_graph(layout = "tree")
##D 
##D # Create a circle graph
##D create_graph() %>%
##D   add_gnm_graph(
##D     n = 55,
##D     m = 75,
##D     set_seed = 23) %>%
##D   render_graph(
##D     layout = "circle")
##D 
##D # Render the graph using the
##D # `visNetwork` output option
##D create_graph() %>%
##D   add_balanced_tree(
##D     k = 2, h = 3) %>%
##D   render_graph(
##D     output = "visNetwork")
## End(Not run)



