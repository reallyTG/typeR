library(spatgraphs)


### Name: spatgraph
### Title: Compute the edges of a spatial graph
### Aliases: spatgraph

### ** Examples


# basic example
x <- matrix(runif(50*2), ncol=2)
g <- spatgraph(x, "knn", par=3)
plot(g, x)

# bigger example
xb <- matrix(runif(5000*2), ncol=2)
gb <- spatgraph(xb, "RNG", maxR=0.1)




