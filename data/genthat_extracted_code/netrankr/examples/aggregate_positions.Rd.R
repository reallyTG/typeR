library(netrankr)


### Name: aggregate_positions
### Title: Quantification of (indirect) relations
### Aliases: aggregate_positions

### ** Examples

library(igraph)
library(magrittr)

g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
#degree
g %>% indirect_relations(type='adjacency') %>% 
 aggregate_positions(type='sum')

#closeness centrality
g %>% indirect_relations(type='dist_sp') %>% 
  aggregate_positions(type='invsum')
  
#betweenness centrality
g %>% indirect_relations(type='depend_sp') %>% 
  aggregate_positions(type='sum')
  
#eigenvector centrality
g %>% indirect_relations(type='walks',FUN=walks_limit_prop) %>% 
  aggregate_positions(type='sum')

#subgraph centrality
g %>% indirect_relations(type='walks',FUN=walks_exp) %>% 
  aggregate_positions(type='self')
  



