library(phangorn)


### Name: splitsNetwork
### Title: Phylogenetic Network
### Aliases: splitsNetwork
### Keywords: cluster

### ** Examples


data(yeast)
dm <- dist.ml(yeast)
fit <- splitsNetwork(dm)
net <- as.networx(fit)
plot(net, "2D")
write.nexus.splits(fit)




