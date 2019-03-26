library(igraph)


### Name: sequential_pal
### Title: Sequential palette
### Aliases: sequential_pal

### ** Examples

## Not run: 
##D library(igraphdata)
##D data(karate)
##D karate <- karate %>%
##D   add_layout_(with_kk()) %>%
##D   set_vertex_attr("size", value = 10)
##D 
##D V(karate)$color <- scales::dscale(degree(karate) %>% cut(5), sequential_pal)
##D plot(karate)
## End(Not run)



