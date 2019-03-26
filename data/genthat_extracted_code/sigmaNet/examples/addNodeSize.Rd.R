library(sigmaNet)


### Name: addNodeSize
### Title: Modify the node size of a 'sigmaNet' object.
### Aliases: addNodeSize

### ** Examples

library(igraph)
library(sigmaNet)
library(magrittr)

data(lesMis)

l <- layout_nicely(lesMis)

#one size for all nodes
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addNodeSize(oneSize = 3)
sig

#using a size attribute
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addNodeSize(sizeMetric = 'degree', minSize = 2, maxSize = 8)
sig

#using a vector
customSize <- log10(degree(lesMis))
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
 addNodeSize(sizeVector = customSize)
sig




