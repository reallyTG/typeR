library(BoolNet)


### Name: simplifyNetwork
### Title: Simplify the functions of a synchronous, asynchronous, or
###   probabilistic Boolean network
### Aliases: simplifyNetwork
### Keywords: Boolean network probabilistic Boolean network PBN logic
###   simplify simplification

### ** Examples

# load example data
data(cellcycle)

# perturb the network
perturbedNet <- perturbNetwork(cellcycle, perturb="functions", method="shuffle")
print(perturbedNet$interactions)

# simplify the network
perturbedNet <- simplifyNetwork(perturbedNet)
print(perturbedNet$interactions)



