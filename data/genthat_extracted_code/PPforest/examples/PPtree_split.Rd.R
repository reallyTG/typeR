library(PPforest)


### Name: PPtree_split
### Title: Projection pursuit classification tree with random variable
###   selection in each split
### Aliases: PPtree_split
### Keywords: tree

### ** Examples

#crab data set

Tree.crab <- PPtree_split('Type~.', data = crab, PPmethod = 'LDA', size.p = 0.5)
Tree.crab




