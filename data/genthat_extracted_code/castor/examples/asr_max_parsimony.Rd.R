library(castor)


### Name: asr_max_parsimony
### Title: Maximum-parsimony ancestral state reconstruction.
### Aliases: asr_max_parsimony
### Keywords: maximum parsimony ancestral state reconstruction Sankoff's
###   algorithm

### ** Examples

# generate random tree
Ntips = 10
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# simulate a discrete trait
Nstates = 5
Q = get_random_mk_transition_matrix(Nstates, rate_model="ER")
tip_states = simulate_mk_model(tree, Q)$tip_states

# reconstruct node states via MPR
results = asr_max_parsimony(tree, tip_states, Nstates)
node_states = max.col(results$ancestral_likelihoods)

# print reconstructed node states
print(node_states)



