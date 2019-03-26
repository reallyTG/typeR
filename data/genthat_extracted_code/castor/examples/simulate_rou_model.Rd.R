library(castor)


### Name: simulate_rou_model
### Title: Simulate a reflected Ornstein-Uhlenbeck model for continuous
###   trait evolution.
### Aliases: simulate_rou_model
### Keywords: OU model random

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=10000)$tree

# simulate evolution of a continuous trait whose value is always >=1
tip_states = simulate_rou_model(tree, reflection_point=1, spread=2, decay_rate=0.1)$tip_states

# plot histogram of simulated tip states
hist(tip_states, breaks=20, xlab="state", main="Trait probability distribution", prob=TRUE)



