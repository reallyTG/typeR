library(castor)


### Name: hsp_squared_change_parsimony
### Title: Hidden state prediction via squared-change parsimony.
### Aliases: hsp_squared_change_parsimony
### Keywords: maximum parsimony ancestral state reconstruction hidden state
###   prediction BM model

### ** Examples

# generate random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# simulate a continuous trait
tip_states = simulate_ou_model(tree, stationary_mean=0, spread=1, decay_rate=0.001)$tip_states

# print tip states
print(tip_states)

# set half of the tips to unknown state
tip_states[sample.int(Ntips,size=as.integer(Ntips/2),replace=FALSE)] = NA

# reconstruct all tip states via weighted SCP
estimated_states = hsp_squared_change_parsimony(tree, tip_states, weighted=TRUE)$states

# print estimated tip states
print(estimated_states[1:Ntips])



