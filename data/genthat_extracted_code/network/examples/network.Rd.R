library(network)


### Name: network
### Title: Network Objects
### Aliases: network as.network as.network.network is.network print.network
###   summary.network network.copy print.summary.network $<-.network
###   <-.network
### Keywords: classes graphs

### ** Examples

m <- matrix(rbinom(25,1,.4),5,5)
diag(m) <- 0
g <- network(m, directed=FALSE)
summary(g)

h <- network.copy(g)       #Note: same as h<-g
summary(h)



