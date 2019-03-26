library(EDISON)


### Name: calculateCPProbabilities
### Title: Calculate the changepoint probabilities.
### Aliases: calculateCPProbabilities

### ** Examples


# Generate random gene network and simulate data from it
dataset = simulateNetwork()

# Run MCMC simulation to infer networks and changepoint locations
result = EDISON.run(dataset$sim_data, num.iter=500)

# Calculate posterior probabilities of changepoints
cps = calculateCPProbabilities(result)




