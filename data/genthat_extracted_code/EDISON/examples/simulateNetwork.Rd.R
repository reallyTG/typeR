library(EDISON)


### Name: simulateNetwork
### Title: Generate network and simulate data.
### Aliases: simulateNetwork

### ** Examples


# Generate random network and simulate data with default parameters
dataset = simulateNetwork()

# Generate random network and simulate data with an average of 
# 1 change per node among network segments
dataset = simulateNetwork(lambda_3=1)

# Generate random network and simulate data with an average of 
# 1 change per node among network segments and standard deviation 
# of the Gaussian observation noise 0.5
dataset = simulateNetwork(lambda_3=1, noise=0.5)

# Generate random network with default parameters
network = generateNetwork()

# Simulate data using generated network
dataset = simulateNetwork(net=network)

# Generate random network with 4 changepoints and 15 nodes, 
# with changepoints distributed over a timeseries of length 50
network = generateNetwork(l=50, q=15, fixed=TRUE, k_bar=4)

# Simulate data of length 50 using generated network
dataset = simulateNetwork(net=network)




