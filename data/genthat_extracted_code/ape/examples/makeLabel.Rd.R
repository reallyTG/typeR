library(ape)


### Name: makeLabel
### Title: Label Management
### Aliases: makeLabel makeLabel.character makeLabel.phylo
###   makeLabel.multiPhylo makeLabel.DNAbin
### Keywords: manip

### ** Examples

x <- rep("a", 3)
makeLabel(x)
make.unique(x) # <- from R's base
x <- rep("aaaaa", 2)
makeLabel(x, len = 3) # made unique and of length 3
makeLabel(x, len = 3, make.unique = FALSE)



