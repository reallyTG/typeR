library(igraph)


### Name: as_membership
### Title: Declare a numeric vector as a membership vector
### Aliases: as_membership

### ** Examples

## Compare to the correct clustering
g <- (make_full_graph(10) + make_full_graph(10)) %>%
  rewire(each_edge(p = 0.2))
correct <- rep(1:2, each = 10) %>% as_membership
fc <- cluster_fast_greedy(g)
compare(correct, fc)
compare(correct, membership(fc))



