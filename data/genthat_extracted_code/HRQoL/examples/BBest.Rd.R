library(HRQoL)


### Name: BBest
### Title: Estimation of the parameters of a beta-binomial distribution
### Aliases: BBest

### ** Examples

# We simulate 1000 observations of a beta-binomial distribution
# for the fixed paramters.
m <- 10
k <- 1000
p <- 0.7
phi <- 1.6

set.seed(5)
y <- rBB(k,m,p,phi)

# Performing the estimation of the parameters

# Method of moments:
MM <- BBest(y,m)
MM

# Maximum likelihood approach
MLE <- BBest(y,m,method="MLE")
MLE




