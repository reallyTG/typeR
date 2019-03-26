library(ape)


### Name: is.binary
### Title: Test for Binary Tree
### Aliases: is.binary is.binary.phylo is.binary.multiPhylo is.binary.tree
### Keywords: logic

### ** Examples

is.binary(rtree(10))
is.binary(rtree(10, rooted = FALSE))
is.binary(stree(10))
x <- setNames(rmtree(10, 10), LETTERS[1:10])
is.binary(x)



