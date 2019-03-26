library(DiagrammeR)


### Name: display_metagraph
### Title: Display a property graph's underlying model
### Aliases: display_metagraph

### ** Examples

## Not run: 
##D # Create a randomized property
##D # graph with 1000 nodes and 1350 edges
##D property_graph <-
##D   create_graph() %>%
##D   add_gnm_graph(
##D     n = 1000,
##D     m = 1350,
##D     set_seed = 23) %>%
##D   select_nodes_by_degree(
##D     expressions = "deg >= 3") %>%
##D   set_node_attrs_ws(
##D     node_attr = type,
##D     value = "a") %>%
##D   clear_selection() %>%
##D   select_nodes_by_degree(
##D     expressions = "deg < 3") %>%
##D   set_node_attrs_ws(
##D     node_attr = type,
##D     value = "b") %>%
##D   clear_selection() %>%
##D   select_nodes_by_degree(
##D     expressions = "deg == 0") %>%
##D   set_node_attrs_ws(
##D     node_attr = type,
##D     value = "c") %>%
##D   set_node_attr_to_display(
##D     attr = type) %>%
##D   select_edges_by_node_id(
##D     nodes =
##D       get_node_ids(.) %>%
##D       sample(
##D         size = 0.15 * length(.) %>%
##D           floor())) %>%
##D   set_edge_attrs_ws(
##D     edge_attr = rel,
##D     value = "r_1") %>%
##D   invert_selection() %>%
##D   set_edge_attrs_ws(
##D     edge_attr = rel,
##D     value = "r_2") %>%
##D   clear_selection() %>%
##D   copy_edge_attrs(
##D     edge_attr_from = rel,
##D     edge_attr_to = label) %>%
##D   add_global_graph_attrs(
##D     attr = "fontname",
##D     value = "Helvetica",
##D     attr_type = "edge") %>%
##D   add_global_graph_attrs(
##D     attr = "fontcolor",
##D     value = "gray50",
##D     attr_type = "edge") %>%
##D   add_global_graph_attrs(
##D     attr = "fontsize",
##D     value = 10,
##D     attr_type = "edge")
##D 
##D # Display this graph's
##D # metagraph, or, the underlying
##D # graph model for a property graph
##D display_metagraph(property_graph)
## End(Not run)



