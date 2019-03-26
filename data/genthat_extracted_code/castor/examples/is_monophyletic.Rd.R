library(castor)


### Name: is_monophyletic
### Title: Determine if a set of tips is monophyletic.
### Aliases: is_monophyletic
### Keywords: MRCA

### ** Examples

# generate random tree
Ntips = 100
tree  = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# pick a random subset of focal tips
focal_tips = which(sample.int(2,size=Ntips,replace=TRUE)==1)

# check if focal tips form a monophyletic group
is_monophyletic(tree, focal_tips)



