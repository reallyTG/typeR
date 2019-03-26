library(igraph)


### Name: diverging_pal
### Title: Diverging palette
### Aliases: diverging_pal

### ** Examples

## Not run: 
##D library(igraphdata)
##D data(foodwebs)
##D fw <- foodwebs[[1]] %>%
##D   induced_subgraph(V(.)[ECO == 1]) %>%
##D   add_layout_(with_fr()) %>%
##D   set_vertex_attr("label", value = seq_len(gorder(.))) %>%
##D   set_vertex_attr("size", value = 10) %>%
##D   set_edge_attr("arrow.size", value = 0.3)
##D 
##D V(fw)$color <- scales::dscale(V(fw)$Biomass %>% cut(10), diverging_pal)
##D plot(fw)
##D 
##D data(karate)
##D karate <- karate %>%
##D   add_layout_(with_kk()) %>%
##D   set_vertex_attr("size", value = 10)
##D 
##D V(karate)$color <- scales::dscale(degree(karate) %>% cut(5), diverging_pal)
##D plot(karate)
## End(Not run)



