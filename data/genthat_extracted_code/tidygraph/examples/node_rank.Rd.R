library(tidygraph)


### Name: node_rank
### Title: Calculate node ranking
### Aliases: node_rank node_rank_hclust node_rank_anneal
###   node_rank_branch_bound node_rank_traveller node_rank_two
###   node_rank_mds node_rank_leafsort node_rank_visual node_rank_spectral
###   node_rank_spin_out node_rank_spin_in node_rank_quadratic
###   node_rank_genetic node_rank_dendser

### ** Examples

graph <- create_notable('zachary') %>%
  mutate(rank = node_rank_hclust())




