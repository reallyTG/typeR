library(networksis)


### Name: simulate.sisnetwork
### Title: Simulate a bipartite network using sequential importance
###   sampling
### Aliases: simulate.sisnetwork
### Keywords: models

### ** Examples

bipartite.graph <- matrix(c(1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0), nrow = 3, byrow = TRUE)
example.net <- network(bipartite.graph)

# Specify the set to which each node belongs
example.net %v% "set" <- c(rep(1, 3),rep(2, 4))

# Simulate 100 graphs with the same marginals as 'example.net'
sim <- simulate.sisnetwork(example.net, nsim = 100)

# Estimated graph space size and SE
exp(sim$log.graphspace.size)
exp(sim$log.graphspace.SE)

# Darwin's finches example
data(finch)

sim <- simulate.sisnetwork(finch, nsim = 100, save.networks = TRUE)

# Calculate importance weights from the graph probabilities
importance.weights <- 1 / exp(sim$log.prob)
hist(importance.weights, breaks = 25, xlab = "Inverse Graph Probability", main="")

# Calculate Sanderson's \bar{S}^2
s.bar.squared.vec <- rep(0, 100)

for(i in 1 : 100)
{
   # Extract simulated bipartite graphs
   new.graph <- as.matrix.network(sim$networks[[i]])

   # Calculate custom graph statistic
   s.bar.squared.vec[i] <- (sum((new.graph %*% t(new.graph)) ^ 2) -
   sum(diag((new.graph %*% t(new.graph)) ^ 2))) / (13 * 12)
}



