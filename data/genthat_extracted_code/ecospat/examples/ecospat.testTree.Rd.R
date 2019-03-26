library(ecospat)


### Name: ecospat.testTree
### Title: Test Tree For The Ecospat package
### Aliases: ecospat.testTree

### ** Examples

fpath <- system.file("extdata", "ecospat.testTree.tre", package="ecospat")
tree <- read.tree(fpath)
plot(tree)



