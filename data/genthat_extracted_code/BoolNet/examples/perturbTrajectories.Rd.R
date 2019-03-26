library(BoolNet)


### Name: perturbTrajectories
### Title: Perturb the state trajectories and calculate robustness measures
### Aliases: perturbTrajectories
### Keywords: Boolean network probabilistic Boolean network, PBN,
###   perturbation perturb trajectory noise robustness

### ** Examples

data(cellcycle)

# calculate average normalized Hamming distance of successor states
hamming <- perturbTrajectories(cellcycle, measure="hamming", numSamples=100)
print(hamming$value)

# calculate average sensitivity of transition function for gene "Cdh1"
sensitivity <- perturbTrajectories(cellcycle, measure="sensitivity", numSamples=100, gene="Cdh1")
print(sensitivity$value)

# calculate percentage of equal attractors for state pairs
attrEqual <- perturbTrajectories(cellcycle, measure="attractor", numSamples=100)
print(attrEqual$value)



