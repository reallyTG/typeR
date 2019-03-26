library(ggm)


### Name: isAcyclic
### Title: Graph queries
### Aliases: isAcyclic
### Keywords: graphs models multivariate

### ** Examples

## A cyclic graph
d <- matrix(0,3,3)
rownames(d) <- colnames(d) <- c("x", "y", "z")
d["x","y"] <- d["y", "z"] <- d["z", "x"] <- 1
## Test if the graph is acyclic
isAcyclic(d)
isAcyclic(d, method = 1)



