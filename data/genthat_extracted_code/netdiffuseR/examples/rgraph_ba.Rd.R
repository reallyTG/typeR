library(netdiffuseR)


### Name: rgraph_ba
### Title: Scale-free and Homophilic Random Networks
### Aliases: rgraph_ba scale-free
### Keywords: distribution

### ** Examples

# Using another graph as a base graph ---------------------------------------
graph <- rgraph_ba()
graph

graph <- rgraph_ba(graph=graph)

# Generating a scale-free homophilic graph (no loops) -----------------------
set.seed(112)
eta <- rep(c(1,1,1,1,2,2,2,2), 20)
ans <- rgraph_ba(t=length(eta) - 1, m=3, self=FALSE, eta=eta)

# Converting it to igraph (so we can plot it)
ig  <- igraph::graph_from_adjacency_matrix(ans)

# Neat plot showing the output
oldpar <- par(no.readonly = TRUE)
par(mfrow=c(1,2))
plot(ig, vertex.color=c("red","blue")[factor(eta)], vertex.label=NA,
    vertex.size=5, main="Scale-free homophilic graph")
suppressWarnings(plot(dgr(ans), main="Degree distribution"))
par(oldpar)




