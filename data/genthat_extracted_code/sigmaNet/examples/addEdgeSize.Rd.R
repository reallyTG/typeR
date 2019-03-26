library(sigmaNet)


### Name: addEdgeSize
### Title: Modify the edge size of a 'sigmaNet' object.
### Aliases: addEdgeSize

### ** Examples

library(igraph)
library(sigmaNet)
library(magrittr)

data(lesMis)

l <- layout_nicely(lesMis)

#specify a single edge size
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addEdgeSize(oneSize = 5)
sig

#specify an attribute and min/max
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addEdgeSize(sizeAttr = 'value', minSize = .1, maxSize = 2)
sig




