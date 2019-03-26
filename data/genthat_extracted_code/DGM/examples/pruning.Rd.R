library(DGM)


### Name: pruning
### Title: Get pruned adjacency network.
### Aliases: pruning

### ** Examples

data("utestdata")
# select only 3-nodes to speed-up this example
sub=subject(myts[,1:3])
p=pruning(sub$adj, sub$models, sub$winner)



