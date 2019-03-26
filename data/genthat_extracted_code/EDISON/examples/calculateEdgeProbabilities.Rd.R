library(EDISON)


### Name: calculateEdgeProbabilities
### Title: Calculate the edge probabilities.
### Aliases: calculateEdgeProbabilities

### ** Examples


# Generate random gene network and simulate data from it
dataset = simulateNetwork(l=25)

# Run MCMC simulation to infer networks and changepoint locations
result = EDISON.run(dataset$sim_data, num.iter=500)

# Calculate marginal posterior probabilities of edges in the network
network = calculateEdgeProbabilities(result)

# Calculate marginal posterior probabilities of edges in the network, 
# using the true changepoints
true.cps = c(2,dataset$epsilon)
network = calculateEdgeProbabilities(result, cps=true.cps)




