library(castor)


### Name: asr_independent_contrasts
### Title: Ancestral state reconstruction via phylogenetic independent
###   contrasts.
### Aliases: asr_independent_contrasts
### Keywords: maximum parsimony ancestral state reconstruction BM model

### ** Examples

# generate random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# simulate a continuous trait
tip_states = simulate_ou_model(tree, stationary_mean=0, spread=1, decay_rate=0.001)$tip_states

# reconstruct node states via weighted PIC
asr = asr_independent_contrasts(tree, tip_states, weighted=TRUE, include_CI=TRUE)
node_states = asr$ancestral_states

# get lower bounds of 95% CIs
lower_bounds = node_states - asr$CI95



