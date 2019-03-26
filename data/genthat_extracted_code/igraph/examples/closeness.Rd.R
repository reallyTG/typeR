library(igraph)


### Name: closeness
### Title: Closeness centrality of vertices
### Aliases: closeness closeness.estimate estimate_closeness
###   estimate_closeness
### Keywords: graphs

### ** Examples


g <- make_ring(10)
g2 <- make_star(10)
closeness(g)
closeness(g2, mode="in")
closeness(g2, mode="out")
closeness(g2, mode="all")




