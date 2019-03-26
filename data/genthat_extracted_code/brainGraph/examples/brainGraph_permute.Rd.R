library(brainGraph)


### Name: brainGraph_permute
### Title: Permutation test for group difference of graph measures
### Aliases: brainGraph_permute

### ** Examples

## Not run: 
##D myResids <- get.resid(lhrh, covars)
##D myPerms <- shuffleSet(n=nrow(myResids$resids.all), nset=1e3)
##D out <- brainGraph_permute(densities, m, perms=myPerms, atlas='dk')
##D out <- brainGraph_permute(densities, m, perms=myPerms, level='vertex')
##D out <- brainGraph_permute(densities, m, perms=myPerms,
##D   level='other', .function=myFun)
## End(Not run)



