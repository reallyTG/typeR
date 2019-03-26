library(ape)


### Name: cophyloplot
### Title: Plots two phylogenetic trees face to face with links between the
###   tips.
### Aliases: cophyloplot
### Keywords: hplot

### ** Examples

#two random trees
tree1 <- rtree(40)
tree2 <- rtree(20)

#creation of the association matrix:
association <- cbind(tree2$tip.label, tree2$tip.label)

cophyloplot(tree1, tree2, assoc = association,
            length.line = 4, space = 28, gap = 3)

#plot with rotations
## Not run: 
##D cophyloplot(tree1, tree2, assoc=association, length.line=4, space=28, gap=3, rotate=TRUE)
## End(Not run)



