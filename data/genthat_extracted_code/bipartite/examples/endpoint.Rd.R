library(bipartite)


### Name: endpoint
### Title: Computes end-point degrees for a bipartite network
### Aliases: endpoint
### Keywords: package

### ** Examples

# reproduces the example of Gitarranz et al. (2011):
data(memmott1999)
ends <- endpoint(memmott1999)
weights.mean <- tapply(memmott1999, ends, mean)
ends.weights <- tapply(ends, ends, mean)
plot(weights.mean, ends.weights, log="xy", pch=16)



