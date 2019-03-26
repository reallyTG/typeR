library(castor)


### Name: asr_subtree_averaging
### Title: Ancestral state reconstruction via subtree averaging.
### Aliases: asr_subtree_averaging
### Keywords: ancestral state reconstruction

### ** Examples

# generate random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# simulate a continuous trait
tip_states = simulate_ou_model(tree, stationary_mean=0, spread=1, decay_rate=0.001)$tip_states

# reconstruct node states by averaging simulated tip states
node_states = asr_subtree_averaging(tree, tip_states)$ancestral_states



