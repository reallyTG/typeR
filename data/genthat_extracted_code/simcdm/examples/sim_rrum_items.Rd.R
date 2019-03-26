library(simcdm)


### Name: sim_rrum_items
### Title: Generate data from the rRUM
### Aliases: sim_rrum_items

### ** Examples

# Set seed for reproducibility
set.seed(217)

# Define Simulation Parameters
N = 1000 # number of individuals
J = 6 # number of items
K = 2 # number of attributes

# Matrix where rows represent attribute classes
As = attribute_classes(K) 

# Latent Class probabilities
pis = c(.1, .2, .3, .4) 

# Q Matrix
Q = rbind(c(1, 0),
          c(0, 1),
          c(1, 0),
          c(0, 1),
          c(1, 1),
          c(1, 1)
    )
    
# The probabiliies of answering each item correctly for individuals 
# who do not lack any required attribute
pistar = rep(.9, J)

# Penalties for failing to have each of the required attributes
rstar  = .5 * Q

# Randomized alpha profiles
alpha  = As[sample(1:(K ^ 2), N, replace = TRUE, pis),]

# Simulate data
rrum_items = sim_rrum_items(Q, rstar, pistar, alpha)



