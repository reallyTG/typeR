## ----Load-library--------------------------------------------------------
library('TreeSearch')

## ----Load-data-----------------------------------------------------------
my.data <- TreeSearch::inapplicable.datasets[['Vinther2008']]
my.phyDat <- phangorn::phyDat(my.data, type='USER', levels=c(0:9, '-'))

## ----Random-tree---------------------------------------------------------
# Set random seed so that random functions will generate consistent output in this document
set.seed(0)
random.tree <- RandomTree(my.phyDat)
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
plot(random.tree)
Fitch(random.tree, my.phyDat)

## ----Neighbour-joining---------------------------------------------------
nj.tree <- NJTree(my.phyDat)
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
plot(nj.tree)
Fitch(nj.tree, my.phyDat)

## ----Outgroup------------------------------------------------------------
outgroup <- c('Nemertean', 'Lingula', 'Terebratulina')
rooted.tree <- EnforceOutgroup(nj.tree, outgroup)
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
plot(rooted.tree)

## ----Basic-NNI-search----------------------------------------------------
better.tree <- TreeSearch(tree=rooted.tree, dataset=my.phyDat, 
                           EdgeSwapper=RootedNNISwap, verbosity=3)

## ----SPR-and-TBR---------------------------------------------------------
better.tree <- TreeSearch(better.tree, my.phyDat, maxHits=8, maxIter=10000,
                           EdgeSwapper=RootedSPRSwap, verbosity=2)
better.tree <- TreeSearch(better.tree, my.phyDat, maxHits=20, maxIter=40000, 
                           EdgeSwapper=RootedTBRSwap, verbosity=2)

## ----Ratchet-search------------------------------------------------------
best.tree <- Ratchet(better.tree, my.phyDat, verbosity=0, ratchIter=5,
                     swappers=list(RootedTBRSwap, RootedSPRSwap, RootedNNISwap))
attr(best.tree, 'score') # Each tree is labelled with its score during tree search

## ----Plot-best-tree------------------------------------------------------
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
plot(best.tree)

## ----Consensus-----------------------------------------------------------
some.optimal.trees <- MultiRatchet(best.tree, nSearch=20, my.phyDat, swappers=
                                   list(RootedTBRSwap, RootedNNISwap))

## ----Plot-strict-consensus-----------------------------------------------
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
strict.consensus <- ape::consensus(some.optimal.trees)
plot(strict.consensus)

## ----Plot-majority-rule-consensus----------------------------------------
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
majority.consensus <- ape::consensus(some.optimal.trees, p=0.5)
plot(majority.consensus)

node.frequency <- SplitFrequency(majority.consensus, some.optimal.trees) /
  length(some.optimal.trees)
ape::nodelabels(paste('\n\n', signif(node.frequency, 2)), 
           col=SupportColour(node.frequency), 
           adj=0, pos=2, frame='none')


## ----Jackknife-annotations-----------------------------------------------
jack.trees <- Jackknife(best.tree, my.phyDat, EdgeSwapper=RootedTBRSwap,
                        jackIter=25, verbosity=0)
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
plot(strict.consensus)

jack.support <- SplitFrequency(strict.consensus, jack.trees) / length(jack.trees)
ape::nodelabels(paste('\n\n', signif(jack.support, 2)), 
           col=SupportColour(jack.support), 
           adj=0, pos=2, frame='none')

