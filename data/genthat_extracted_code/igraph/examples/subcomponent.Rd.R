library(igraph)


### Name: subcomponent
### Title: In- or out- component of a vertex
### Aliases: subcomponent
### Keywords: graphs

### ** Examples


g <- sample_gnp(100, 1/200)
subcomponent(g, 1, "in")
subcomponent(g, 1, "out")
subcomponent(g, 1, "all")



