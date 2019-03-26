library(Claddis)


### Name: DolloSCM
### Title: Stochastic Character Map For Dollo Character
### Aliases: DolloSCM

### ** Examples


# Create a random 10-taxon tree:
tree <- rtree(10)

# Arbitrarily add a root.time value of 100 Ma:
tree$root.time <- 100

# Generate random tip states (0s and 1s):
tip.states <- sample(c(0, 1), 10, replace = TRUE)

# Add labels to tip states:
names(tip.states) <- tree$tip.label

# Get a single stochastic character map:
out <- DolloSCM(tree, tip.states)

# View matrix of changes:
out$Changes

# View stochastic character map (time spent in each state on each branch):
out$SCM




