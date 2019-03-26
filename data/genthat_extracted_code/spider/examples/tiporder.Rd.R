library(spider)


### Name: tiporder
### Title: Orders tip labels by their position on the tree.
### Aliases: tiporder
### Keywords: Utilities

### ** Examples


data(anoteropsis)
anoTree <- ape::nj(ape::dist.dna(anoteropsis))
tiporder(anoTree)
tiporder(anoTree, labels = FALSE)


data(woodmouse)
woodTree <- ape::nj(ape::dist.dna(woodmouse))
tiporder(woodTree)
tiporder(ape::ladderize(woodTree))




