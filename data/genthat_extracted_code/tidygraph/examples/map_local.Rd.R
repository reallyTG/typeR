library(tidygraph)


### Name: map_local
### Title: Map a function over a graph representing the neighborhood of
###   each node
### Aliases: map_local map_local_lgl map_local_chr map_local_int
###   map_local_dbl

### ** Examples

# Smooth out values over a neighborhood
create_notable('meredith') %>%
  mutate(value = rpois(graph_order(), 5)) %>%
  mutate(value_smooth = map_local_dbl(order = 2, .f = function(neighborhood, ...) {
    mean(as_tibble(neighborhood, active = 'nodes')$value)
  }))



