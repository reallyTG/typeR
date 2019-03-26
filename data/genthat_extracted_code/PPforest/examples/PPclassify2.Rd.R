library(PPforest)


### Name: PPclassify2
### Title: Predict class for the test set and calculate prediction error
###   after finding the PPtree structure, .
### Aliases: PPclassify2
### Keywords: tree

### ** Examples

#crab data set

Tree.crab <- PPtree_split('Type~.', data = crab, PPmethod = 'LDA', size.p = 0.5)
Tree.crab

PPclassify2(Tree.crab)




