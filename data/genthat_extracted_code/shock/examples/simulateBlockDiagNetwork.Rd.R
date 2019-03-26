library(shock)


### Name: simulateBlockDiagNetwork
### Title: Simulate a modular network
### Aliases: simulateBlockDiagNetwork

### ** Examples

## number of variables
p <- 100
## number of blocks
K <- 15
## vector of partition into blocks
labels <- factor(rep(1:K, length.out=p))
## simulate network 
g <- simulateBlockDiagNetwork(p,labels)
        




