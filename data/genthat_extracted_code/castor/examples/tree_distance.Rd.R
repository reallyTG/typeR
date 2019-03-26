library(castor)


### Name: tree_distance
### Title: Calculate the distance between two trees.
### Aliases: tree_distance
### Keywords: tree comparison

### ** Examples

# generate a random tree
Ntips = 1000
treeA = generate_random_tree(list(birth_rate_intercept=1),
                            max_tips=Ntips)$tree
                            
# create a second tree with slightly different topology
treeB = treeA
shuffled_tips = sample.int(Ntips, size=Ntips/10, replace=FALSE)
treeB$tip.label[shuffled_tips] = treeB$tip.label[sample(shuffled_tips)]

# calculate Robinson-Foulds distance between trees
distance = tree_distance(treeA, treeB, metric="RF")



