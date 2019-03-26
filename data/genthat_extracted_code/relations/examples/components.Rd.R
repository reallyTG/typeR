library(relations)


### Name: components
### Title: Connected components
### Aliases: relation_connected_components relation_condensation
###   relation_component_representation
### Keywords: math

### ** Examples

## example from La Poutre and van Leeuwen:

require("sets")				# set(), pair() etc.

G <- set(pair(1L, 2L), pair(2L, 1L), pair(1L, 3L), pair(3L, 1L),
         pair(3L, 7L), pair(2L, 5L), pair(2L, 6L), pair(6L, 5L),
         pair(5L, 7L), pair(4L, 6L), pair(5L, 4L), pair(4L, 7L))

R <- endorelation(graph = G)

relation_connected_components(R)
relation_graph(relation_condensation(R))
relation_graph(relation_component_representation(R))



