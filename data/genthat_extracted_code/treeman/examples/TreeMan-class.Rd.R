library(treeman)


### Name: TreeMan-class
### Title: TreeMan-class
### Aliases: TreeMan-class TreeMan-method [[,TreeMan,character-method
###   [,TreeMan,character,missing,missing-method
###   as.character,TreeMan-method show,TreeMan-method print,TreeMan-method
###   str,TreeMan-method summary,TreeMan-method cTrees,TreeMan-method

### ** Examples

library(treeman)
# Generate random tree
tree <- randTree(10)
# Print to get basic stats
summary(tree)
# Slots....
tree['tips']   # return all tips IDs
tree['nds']    # return all internal node IDs
tree['ntips']  # count all tips
tree['nnds']   # count all internal nodes
tree['root']   # identify root node
tree[['t1']]   # return t1 node object
tree['pd']     # return phylogenetic diversity
tree['ply']    # is polytomous?
# Additional special slots (calculated upon call)
tree['age']   # get tree's age
tree['ultr']  # determine if tree is ultrametric
tree['spns']  # get all the spans of the tree IDs
tree['prids'] # get all the IDs of preceding nodes
tree['ptids'] # get all the IDs of following nodes
tree['txnyms'] # get all the taxonyms of all nodes
# In addition [] can be used for any user-defined slot
# Because all nodes are lists with metadata we can readily
#  get specific information on nodes of interest
nd <- tree[['n2']]
summary(nd)
# And then use the same syntax for the tree
nd['nkids']  # .... nkids, pd, etc.

# Convert to phylo and plot
library(ape)
tree <- as(tree, 'phylo')
plot(tree)



