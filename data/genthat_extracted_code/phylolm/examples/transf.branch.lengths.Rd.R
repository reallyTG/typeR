library(phylolm)


### Name: transf.branch.lengths
### Title: Creates a tree with branch lengths to represent the 3-point
###   structure of a covariance matrix
### Aliases: transf.branch.lengths

### ** Examples

set.seed(123456)
tre1 = rcoal(10)
tre2 = transf.branch.lengths(phy=tre1, model="OUrandomRoot",
                             parameters = list(alpha=1))
par(mfrow = c(2,1))
plot(tre1)
plot(tre2$tree,root.edge=TRUE)



