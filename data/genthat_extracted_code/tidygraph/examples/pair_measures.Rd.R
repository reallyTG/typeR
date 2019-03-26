library(tidygraph)


### Name: pair_measures
### Title: Calculate node pair properties
### Aliases: pair_measures node_adhesion_to node_adhesion_from
###   node_cohesion_to node_cohesion_from node_distance_to
###   node_distance_from node_cocitation_with node_bibcoupling_with
###   node_similarity_with node_max_flow_to node_max_flow_from

### ** Examples

# Calculate the distance to the center node
create_notable('meredith') %>%
  mutate(dist_to_center = node_distance_to(node_is_center()))



