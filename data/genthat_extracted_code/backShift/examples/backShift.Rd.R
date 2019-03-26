library(backShift)


### Name: backShift
### Title: Estimate connectivity matrix of a directed graph with linear
###   effects and hidden variables.
### Aliases: backShift
### Keywords: Causality Regression Hidden Variables Feedback

### ** Examples

## Simulate data with connectivity matrix A

seed <- 1
# sample size n
n <- 10000
# 3 predictor variables
p  <- 3
A <- diag(p)*0
A[1,2] <- 0.8
A[2,3] <- -0.8
A[3,1] <- 0.8

# divide data into 10 different environments
G <- 10

# simulate
simulation.res <- simulateInterventions(
                    n, p, A, G, intervMultiplier = 2,
                    noiseMult = 1, nonGauss = FALSE,
                    fracVarInt = 0.5, hidden = TRUE,
                    knownInterventions = FALSE,
                    simulateObs = TRUE, seed)

environment <- simulation.res$environment
X <- simulation.res$X

## Compute feedback estimator with stability selection

network <- backShift(X, environment, ev = 1)

## Print point estimates and stable edges

# true connectivity matrix
print(A)
# point estimate
print(network$Ahat)
# shows empirical selection probability for stable edges
print(network$AhatAdjacency)



