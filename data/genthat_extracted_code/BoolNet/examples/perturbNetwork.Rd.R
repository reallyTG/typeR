library(BoolNet)


### Name: perturbNetwork
### Title: Perturb a Boolean network randomly
### Aliases: perturbNetwork
### Keywords: Boolean network probabilistic Boolean network PBN state
###   perturb perturbation noise robustness

### ** Examples

# load example data
data(cellcycle)

# perturb the network
perturbedNet1 <- perturbNetwork(cellcycle, perturb="functions", method="shuffle")
perturbedNet2 <- perturbNetwork(cellcycle, perturb="transitions", method="bitflip")

# get attractors
print(getAttractors(perturbedNet1))
print(getAttractors(perturbedNet2))



