library(igraph)


### Name: layout_with_mds
### Title: Graph layout by multidimensional scaling
### Aliases: layout_with_mds layout.mds with_mds
### Keywords: graphs

### ** Examples


g <- sample_gnp(100, 2/100)
l <- layout_with_mds(g)
plot(g, layout=l, vertex.label=NA, vertex.size=3)



