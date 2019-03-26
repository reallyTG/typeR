library(sigmaNet)


### Name: addEdgeColors
### Title: Modify the edge colors of a 'sigmaNet' object.
### Aliases: addEdgeColors

### ** Examples

library(igraph)
library(sigmaNet)
library(magrittr)

data(lesMis)

l <- layout_nicely(lesMis)

#one color for all edges
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addEdgeColors(oneColor = '#D95F02')
sig




