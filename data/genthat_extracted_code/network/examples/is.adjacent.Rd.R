library(network)


### Name: is.adjacent
### Title: Determine Whether Two Vertices Are Adjacent
### Aliases: is.adjacent
### Keywords: graphs

### ** Examples

#Create a very simple graph
g<-network.initialize(3)
add.edge(g,1,2)
is.adjacent(g,1,2)  #TRUE
is.adjacent(g,2,1)  #FALSE
g[1,2]==1           #TRUE
g[2,1]==1           #FALSE



