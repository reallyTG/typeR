library(DWLasso)


### Name: weightComp
### Title: Computing weights from the degree of the inferred network
### Aliases: weightComp

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

# Compute weights from the inferred network
w.mb <- rep(1,p)
w.Mat <- weightComp(dat,lam=0.4,w.mb)



