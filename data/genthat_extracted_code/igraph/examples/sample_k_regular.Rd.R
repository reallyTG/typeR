library(igraph)


### Name: sample_k_regular
### Title: Create a random regular graph
### Aliases: sample_k_regular k.regular.game
### Keywords: graphs

### ** Examples


## A simple ring
ring <- sample_k_regular(10, 2)
plot(ring)

## k-regular graphs on 10 vertices, with k=1:9
k10 <- lapply(1:9, sample_k_regular, no.of.nodes=10)

layout(matrix(1:9, nrow=3, byrow=TRUE))
sapply(k10, plot, vertex.label=NA)



