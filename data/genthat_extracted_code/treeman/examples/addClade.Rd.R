library(treeman)


### Name: addClade
### Title: Add clade to tree
### Aliases: addClade

### ** Examples

library(treeman)
t1 <- randTree(100)
# extract a clade
cld <- getSubtree(t1, 'n2')
# remove the same clade
t2 <- rmClade(t1, 'n2')
# add the clade again
t3 <- addClade(t2, 'n2', cld)
# t1 and t3 should be the same
# note there is no need to remove a clade before adding
t3 <- addClade(t1, 'n2', cld)  # same tree



