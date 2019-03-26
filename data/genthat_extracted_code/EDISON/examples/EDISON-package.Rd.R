library(EDISON)


### Name: EDISON-package
### Title: Allows for network reconstruction and changepoint detection.
### Aliases: EDISON EDISON-package
### Keywords: package

### ** Examples


# Generate random gene network and simulate data from it
dataset = simulateNetwork(l=25)

# Run MCMC simulation to infer networks and changepoint locations
result = EDISON.run(dataset$sim_data, num.iter=500)

# Calculate posterior probabilities of changepoints
cps = calculateCPProbabilities(result)

# Calculate marginal posterior probabilities of edges in the network
network = calculateEdgeProbabilities(result)





