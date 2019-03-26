library(msBP)


### Name: msBP.nrvTrees
### Title: Nesting of the sample through the tree
### Aliases: msBP.nrvTrees

### ** Examples

sh <- cbind(c(2,2,2,3,3,3,3,3,3,3), c(1,2,2,1,2,3,4,5,6,7))
nrv.trees <- msBP.nrvTrees(sh)
plot(nrv.trees$n)



