library(igraph)


### Name: component_wise
### Title: Component-wise layout
### Aliases: component_wise

### ** Examples

g <- make_ring(10) + make_ring(10)
g %>%
  add_layout_(in_circle(), component_wise()) %>%
  plot()



