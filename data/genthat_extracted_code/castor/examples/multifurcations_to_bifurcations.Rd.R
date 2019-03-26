library(castor)


### Name: multifurcations_to_bifurcations
### Title: Expand multifurcations to bifurcations.
### Aliases: multifurcations_to_bifurcations
### Keywords: multifurcations

### ** Examples

# generate a random multifurcating tree
Ntips = 1000
tree = generate_random_tree(list(birth_rate_intercept=1), Ntips, Nsplits=5)$tree

# expand multifurcations to bifurcations
new_tree = multifurcations_to_bifurcations(tree)$tree

# print summary of old and new tree
cat(sprintf("Old tree has %d nodes\n",tree$Nnode))
cat(sprintf("New tree has %d nodes\n",new_tree$Nnode))



