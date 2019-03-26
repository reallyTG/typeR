library(TreeSearch)


### Name: IWTreeSearch
### Title: Search for most parsimonious trees
### Aliases: IWTreeSearch EdgeListSearch TreeSearch ProfileTreeSearch
### Keywords: internal tree

### ** Examples

data('Lobo')
njtree <- NJTree(Lobo.phy)

## Not run: 
##D TreeSearch(njtree, Lobo.phy, maxIter=20, EdgeSwapper=NNISwap)
##D TreeSearch(njtree, Lobo.phy, maxIter=20, EdgeSwapper=RootedSPRSwap)
##D TreeSearch(njtree, Lobo.phy, maxIter=20, EdgeSwapper=TBRSwap)
## End(Not run)




