library(GGMselect)


### Name: selectQE
### Title: Estimate a graph in a Gaussian Graphical Model: Quasi Exhaustive
###   search
### Aliases: selectQE
### Keywords: multivariate graphs models

### ** Examples

p=30
n=30
# simulate graph
eta=0.11
Gr <- simulateGraph(p,eta)
# simulate data
X <- rmvnorm(n, mean=rep(0,p), sigma=Gr$C)
# estimate graph
## Not run: GQE <- selectQE(X)

# plot the result
## Not run: library(network)
## Not run: par(mfrow=c(1,2))
## Not run: gV <- network(Gr$G)
## Not run: plot(gV,jitter=TRUE, usearrows = FALSE, label=1:p,displaylabels=TRUE)
## Not run: gQE <- network(GQE$G)
## Not run: plot(gQE, jitter=TRUE, usearrows = FALSE,  label=1:p,displaylabels=TRUE)



