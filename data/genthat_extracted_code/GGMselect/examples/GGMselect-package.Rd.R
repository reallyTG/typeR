library(GGMselect)


### Name: GGMselect-package
### Title: Gaussian Graphs Models selection
### Aliases: GGMselect-package GGMselect
### Keywords: package multivariate graphs models

### ** Examples

p=30
n=30
# simulate graph
eta=0.11
Gr <- simulateGraph(p,eta)
# simulate data
X <- rmvnorm(n, mean=rep(0,p), sigma=Gr$C)
# estimate graph
## Not run: GRest <- selectFast(X)

# plot result
## Not run: library(network)
## Not run: par(mfrow=c(1,2))
## Not run: gV <- network(Gr$G)
## Not run: plot(gV,jitter=TRUE, usearrows = FALSE, label=1:p,displaylabels=TRUE)
## Not run: g <- network(GRest$EW$G)
## Not run: plot(g, jitter=TRUE, usearrows = FALSE,  label=1:p,displaylabels=TRUE)



