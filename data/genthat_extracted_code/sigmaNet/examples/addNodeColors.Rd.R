library(sigmaNet)


### Name: addNodeColors
### Title: Modify the node colors of a 'sigmaNet' object.
### Aliases: addNodeColors

### ** Examples

library(igraph)
library(sigmaNet)
library(magrittr)

data(lesMis)

l <- layout_nicely(lesMis)

#one color for all nodes
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addNodeColors(oneColor = '#D95F02')
sig

#color based on attribute (edge betweenness cluster)
clust <- cluster_edge_betweenness(lesMis)$membership
V(lesMis)$group <- clust

sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addNodeColors(colorAttr = 'group', colorPal = 'Set1')
sig




