library(castor)


### Name: get_reds
### Title: Calculate relative evolutionary divergences in a tree.
### Aliases: get_reds
### Keywords: relative evolutionary divergence

### ** Examples

# generate a random tree
params = list(birth_rate_intercept=1, death_rate_intercept=0.8)
tree = generate_random_tree(params, max_time=100, coalescent=FALSE)$tree

# calculate and print REDs
REDs = get_reds(tree)
print(REDs)



