library(DWLasso)


### Name: MBLasso
### Title: Inferring the network using nodewise regression method
### Aliases: MBLasso

### ** Examples

library(DWLasso)
library(glmnet)
library(hglasso)


# Generate inverse covariance matrix with 3 hubs
# 20 % of the elements within a hub are zero
# 97 % of the elements that are not within hub nodes are zero
p <- 60 # Number of variables
n <- 40 # Number of samples

hub_number = 3  # Number of hubs

# Generate the adjacency matrix
Theta <- HubNetwork(p,0.97,hub_number,0.2)$Theta

# Generate a data matrix
out <- rmvnorm(n,rep(0,p),solve(Theta))

# Standardize the data
dat <- scale(out)

# Infer the network using weighted nodewise regression
w.mb <- rep(1,p)
adj.mat <- MBLasso(dat,lambda=0.4,w.mb)



