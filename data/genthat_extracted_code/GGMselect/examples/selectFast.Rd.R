library(GGMselect)


### Name: selectFast
### Title: Estimate a graph in a Gaussian Graphical Model: Fast procedure
### Aliases: selectFast
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
GRest <- selectFast(X, family="C01")

# plot result
library(network)
par(mfrow=c(1,2))
gV <- network(Gr$G)
plot(gV,jitter=TRUE, usearrows = FALSE, label=1:p,displaylabels=TRUE)
g <- network(GRest$C01$G)
plot(g, jitter=TRUE, usearrows = FALSE,  label=1:p,displaylabels=TRUE)



