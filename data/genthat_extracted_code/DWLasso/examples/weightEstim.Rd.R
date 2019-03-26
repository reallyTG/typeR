library(DWLasso)


### Name: weightEstim
### Title: Estimating weights from the degree of the inferred network
### Aliases: weightEstim
### Keywords: ~kwd1 ~kwd2

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

# Estimate weights from the degrees of the inferred network
w.est <- weightEstim(dat, lam=0.4, a=1, tol=1e-6)



