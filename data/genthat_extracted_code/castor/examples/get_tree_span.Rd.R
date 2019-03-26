library(castor)


### Name: get_tree_span
### Title: Get min and max distance of any tip to the root.
### Aliases: get_tree_span
### Keywords: phylogenetic distance

### ** Examples

# generate a random tree
Ntips   = 1000
params  = list(birth_rate_intercept=1, death_rate_intercept=0.5)
tree    = generate_random_tree(params, max_tips=Ntips, coalescent=FALSE)$tree

# calculate min & max tip distances from root
tree_span = get_tree_span(tree)
cat(sprintf("Tip min dist = %g, max dist = %g\n",
            tree_span$min_distance,
            tree_span$max_distance))



