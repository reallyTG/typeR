library(sigmaNet)


### Name: sigmaFromIgraph
### Title: Make a basic 'sigmaNet' graph object from an 'igraph' object
### Aliases: sigmaFromIgraph

### ** Examples

library(igraph)
library(sigmaNet)

data(lesMis)

l <- layout_nicely(lesMis)
sig <- sigmaFromIgraph(graph = lesMis, layout = l)

#render basic visualization by calling the object
sig



