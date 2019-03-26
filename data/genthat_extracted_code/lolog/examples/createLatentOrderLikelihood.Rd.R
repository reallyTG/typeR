library(lolog)


### Name: createLatentOrderLikelihood
### Title: Creates a probability model for a latent ordered network model
### Aliases: createLatentOrderLikelihood

### ** Examples

# See the methods of the objects returned by this function
UndirectedLatentOrderLikelihood
DirectedLatentOrderLikelihood

# A Barabasi-Albert type graph model with 1000 vertices
el <- matrix(0, nrow=0, ncol=2)
net <- new(UndirectedNet, el, 1000L)
lolik <- createLatentOrderLikelihood(net ~ preferentialAttachment(), theta=1)
banet <- lolik$generateNetwork()$network # generate a random network from the model
degrees <- banet$degree(1:1000)
hist(degrees, breaks=100) # plot the degree distribution
order <- banet[["__order__"]] # The vertex inclusion order

# Earlier nodes have higher degrees
library(ggplot2)
qplot(order, degrees, alpha=I(.25)) + geom_smooth(method="loess")




