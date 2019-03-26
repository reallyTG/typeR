library(hglasso)


### Name: HubNetwork
### Title: Hub network generation
### Aliases: HubNetwork

### ** Examples

# Generate inverse covariance matrix with 5 hubs
# 30% of the elements within a hub are zero 
# 95% of the elements that are not within hub nodes are zero
p <- 100
Theta <- HubNetwork(p,0.95,5,0.3)$Theta

# Generate covariance matrix with 5 hubs with similar structure
Sigma <- HubNetwork(p,0.95,5,0.3,type="covariance")$Theta

# Generate binary network with 2 hubs with p=10
Theta <- HubNetwork(p=10,0.95,2,0.3,type="binary")$Theta



