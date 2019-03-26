library(igraph)


### Name: automorphisms
### Title: Number of automorphisms
### Aliases: automorphisms graph.automorphisms
### Keywords: graphs

### ** Examples


## A ring has n*2 automorphisms, you can "turn" it by 0-9 vertices
## and each of these graphs can be "flipped"
g <- make_ring(10)
automorphisms(g)



