library(sigmaNet)


### Name: addNodeLabels
### Title: Modify the node labels of a 'sigmaNet' object.
### Aliases: addNodeLabels

### ** Examples

library(igraph)
library(sigmaNet)
library(magrittr)

data(lesMis)

l <- layout_nicely(lesMis)
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addNodeLabels(labelAttr = 'label')
sig




