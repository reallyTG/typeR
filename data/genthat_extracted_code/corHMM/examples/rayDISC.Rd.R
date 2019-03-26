library(corHMM)


### Name: rayDISC
### Title: Evolution of categorical traits
### Aliases: rayDISC dev.raydisc
### Keywords: models

### ** Examples

# Not run
### Example 1
# Load data
# data(rayDISC.example)

## Perform ancestral state estimation, using an asymmetric model of evolution and marginal
## reconstruction of ancestral states
# recon <- rayDISC(rayDISC.example$tree,rayDISC.example$trait,model="ARD",
# node.states="marginal")

## Plot reconstructions on tree
# plotRECON(rayDISC.example$tree,recon$states)

### Example 2
## Perform ancestral state estimation on second character, using a single-rate model of
## evolution, marginal reconstruction of ancestral states, and setting the lower bound for
##parameter estimates to 0.01
# recon <- rayDISC(rayDISC.example$tree,rayDISC.example$trait,charnum=2,model="ER",
# node.states="marginal",lb=0.01)

### Example 3
## Perform ancestral state estimation on third character, using a single-rate model of
## evolution and joint reconstruction of ancestral states
# recon <- rayDISC(rayDISC.example$tree,rayDISC.example$trait,charnum=3,
# model="ER",node.states="joint")



