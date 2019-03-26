library(castor)


### Name: asr_squared_change_parsimony
### Title: Squared-change parsimony ancestral state reconstruction.
### Aliases: asr_squared_change_parsimony
### Keywords: maximum parsimony ancestral state reconstruction BM model

### ** Examples

# generate random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# simulate a continuous trait
tip_states = simulate_ou_model(tree, stationary_mean=0, spread=1, decay_rate=0.001)$tip_states

# reconstruct node states based on simulated tip states
node_states = asr_squared_change_parsimony(tree, tip_states, weighted=TRUE)$ancestral_states



