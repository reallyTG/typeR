library(netrankr)


### Name: majorization_gap
### Title: Majorization gap
### Aliases: majorization_gap

### ** Examples

library(igraph)
g <- graph.star(5,'undirected')
majorization_gap(g) #0 since star graphs are threshold graphs

g <- sample_gnp(100,0.15)
majorization_gap(g,norm=TRUE) #fraction of reverse unit transformation
majorization_gap(g,norm=FALSE) #number of reverse unit transformation



