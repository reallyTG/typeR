library(tidygraph)


### Name: node_measures
### Title: Querying node measures
### Aliases: node_measures node_eccentricity node_constraint node_coreness
###   node_diversity node_bridging_score node_effective_network_size
###   node_connectivity_impact node_closeness_impact node_fareness_impact

### ** Examples

# Calculate Burt's Constraint for each node
create_notable('meredith') %>%
  mutate(b_constraint = node_constraint())



