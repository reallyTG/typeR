library(tidygraph)


### Name: morph
### Title: Create a temporary alternative representation of the graph to
###   compute on
### Aliases: morph unmorph crystallise crystallize convert

### ** Examples

create_notable('meredith') %>%
  mutate(group = group_infomap()) %>%
  morph(to_contracted, group) %>%
  mutate(group_centrality = centrality_pagerank()) %>%
  unmorph()



