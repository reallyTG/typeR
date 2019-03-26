library(TreeSearch)


### Name: Jackknife
### Title: Parsimony Ratchet
### Aliases: Jackknife Ratchet ProfileRatchet IWRatchet MultiRatchet
###   IWMultiRatchet RatchetConsensus IWRatchetConsensus
### Keywords: internal tree

### ** Examples

data('Lobo')
njtree <- NJTree(Lobo.phy)
# Increase value of ratchIter and searchHits to do a proper search
quickResult <- Ratchet(njtree, Lobo.phy, ratchIter=2, searchHits=3)
plot(quickResult)
# IW search is currently much slower:
quickIWResult <- IWRatchet(quickResult, Lobo.phy, concavity=2.5,
                           ratchIter=1, searchIter = 25, searchHits=2,
                           swappers=RootedTBRSwap, verbosity=5)
 



