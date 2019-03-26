library(tidygraph)


### Name: graph_measures
### Title: Graph measurements
### Aliases: graph_measures graph_adhesion graph_assortativity
###   graph_automorphisms graph_clique_num graph_clique_count
###   graph_component_count graph_motif_count graph_diameter graph_girth
###   graph_radius graph_mutual_count graph_asym_count graph_unconn_count
###   graph_size graph_order graph_reciprocity graph_min_cut
###   graph_mean_dist

### ** Examples

# Use e.g. to modify computations on nodes and edges
create_notable('meredith') %>%
  activate(nodes) %>%
  mutate(rel_neighbors = centrality_degree()/graph_order())



