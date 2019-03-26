library(castor)


### Name: date_tree_red
### Title: Date a tree based on relative evolutionary divergences.
### Aliases: date_tree_red
### Keywords: dating ultrametric relative evolutionary divergence

### ** Examples

# generate a random non-ultrametric tree
params = list(birth_rate_intercept=1, death_rate_intercept=0.8)
tree = generate_random_tree(params, max_time=1000, coalescent=FALSE)$tree

# make ultrametric, by setting the root to 2 million years
dated_tree = date_tree_red(tree, anchor_age=2e6)



