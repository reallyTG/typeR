library(igraph)


### Name: sample_traits_callaway
### Title: Graph generation based on different vertex types
### Aliases: sample_traits_callaway sample_traits callaway.traits.game
###   establishment.game traits_callaway sample_traits traits
### Keywords: graphs

### ** Examples


# two types of vertices, they like only themselves
g1 <- sample_traits_callaway(1000, 2, pref.matrix=matrix( c(1,0,0,1), nc=2))
g2 <- sample_traits(1000, 2, k=2, pref.matrix=matrix( c(1,0,0,1), nc=2))



