library(nat)


### Name: prune_strahler
### Title: Prune a neuron by removing segments with a given Strahler order
### Aliases: prune_strahler

### ** Examples

x=Cell07PNs[[1]]
pruned12=prune_strahler(x)
pruned1=prune_strahler(x, 1)
plot(x)
plot(pruned1, lwd=3, col='blue', add=TRUE)
plot(pruned12, lwd=3, col='red', add=TRUE)



