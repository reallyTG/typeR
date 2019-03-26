library(DWLasso)


### Name: DWLasso
### Title: Degree weighted lasso
### Aliases: DWLasso DWLasso
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

# Run DWLasso
out.p <- DWLasso(dat, lambda1 = 0.6, lambda2 = 10)

# print out a summary of the output
summary(out.p)



