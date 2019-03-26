library(GGMselect)


### Name: convertGraph
### Title: Convert graphs into adjacency matrices
### Aliases: convertGraph
### Keywords: multivariate graphs

### ** Examples

p=30
n=30
# simulate graph
eta=0.11
Gr <- simulateGraph(p,eta)
X <- rmvnorm(n, mean=rep(0,p), sigma=Gr$C)
# estimate graph
GRest <- selectFast(X, family="C01")
# Neighb and G are 2 forms of the same result
a <- convertGraph(GRest$C01$Neighb)
print(all.equal(a, GRest$C01$G)) # TRUE
# recalculate the graph with selectMyFam
GMF <- selectMyFam(X, list(a))
print(all.equal(a,GMF$G)) # TRUE



