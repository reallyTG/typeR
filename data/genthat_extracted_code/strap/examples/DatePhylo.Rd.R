library(strap)


### Name: DatePhylo
### Title: Calculates branch lengths for a topology
### Aliases: DatePhylo
### Keywords: time-scaling, phylogeny, fossil

### ** Examples

# Time-scale the lungfish tree using the "equal" method and a root length of 1 Ma:
time.tree <- DatePhylo(Dipnoi$tree, Dipnoi$ages, method="equal", rlen=1)
plot(time.tree, cex=0.5)



