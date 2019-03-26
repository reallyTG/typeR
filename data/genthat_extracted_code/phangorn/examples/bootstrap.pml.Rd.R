library(phangorn)


### Name: bootstrap.pml
### Title: Bootstrap
### Aliases: bootstrap.pml bootstrap.phyDat plotBS
### Keywords: cluster

### ** Examples


## Not run: 
##D data(Laurasiatherian)
##D dm <- dist.logDet(Laurasiatherian)
##D tree <- NJ(dm)
##D # NJ
##D set.seed(123)
##D NJtrees <- bootstrap.phyDat(Laurasiatherian, 
##D      FUN=function(x)NJ(dist.logDet(x)), bs=100)
##D treeNJ <- plotBS(tree, NJtrees, "phylogram")
##D 
##D # Maximum likelihood
##D fit <- pml(tree, Laurasiatherian)
##D fit <- optim.pml(fit, rearrangements="NNI")
##D set.seed(123)
##D bs <- bootstrap.pml(fit, bs=100, optNni=TRUE)
##D treeBS <- plotBS(fit$tree,bs)
##D 
##D # Maximum parsimony
##D treeMP <- pratchet(Laurasiatherian)
##D treeMP <- acctran(treeMP, Laurasiatherian)
##D set.seed(123)
##D BStrees <- bootstrap.phyDat(Laurasiatherian, pratchet, bs = 100)
##D treeMP <- plotBS(treeMP, BStrees, "phylogram")
##D add.scale.bar()
##D 
##D # export tree with bootstrap values as node labels
##D # write.tree(treeBS)
## End(Not run)




