library(simone)


### Name: rNetwork
### Title: Simulation of (clustered) Gaussian networks
### Aliases: rNetwork
### Keywords: graphs datagen

### ** Examples

## generate an Erdos-Renyi network with 50 nodes and Pr of edges = 0.1
plot(rNetwork(p = 50, pi = 0.1, name = "an Erdos-Renyi network"))

## generate an network with 15 nodes and 25 randomly selected edges
plot(rNetwork(p = 15, pi = 25, name = "a 25 edges network"))

## generate an undirected network with an affiliation structure
PI <- matrix(c(15,2,2,50),2,2)
alpha <- c(1/3,2/3)
plot(rNetwork(p = 20, pi = PI, alpha = alpha,
                      name = "Affiliation, fixed num of edges"))

## generate a directed network with hubs
PI <- t(matrix(c(0.2,0.1,0.4,0,0.05,0.15,0,0.4,rep(0,8)),4,4))
alpha <- c(1/20,1/20,9/20,9/20)
plot(rNetwork(p = 55, pi = PI, alpha = alpha, directed = TRUE,
                      name = "Hubs structured network"))



