## ----Load library--------------------------------------------------------
library('TreeSearch')

## ----Load Longrich data--------------------------------------------------
data(congreveLamsdellMatrices)
my.data <- congreveLamsdellMatrices[[10]]

## ----Contrast matrix-----------------------------------------------------
contrast.matrix <- matrix(data=c(
# 0 1 -  # Each column corresponds to a character-state
  1,0,0, # Each row corresponds to a token, here 0, denoting the character-state set {0} 
  0,1,0, # 1 | {1}
  0,0,1, # - | {-}
  1,1,0, # A | {01}
  1,1,0, # + | {01}
  1,1,1  # ? | {01-}
), ncol=3, byrow=TRUE); # ncol should correspond to the number of columns in the matrix
dimnames(contrast.matrix) <- list(
  c(0, 1, '-', 'A', '+', '?'), # A list of the tokens corresponding to each row
                               # in the contrast matrix
  c(0, 1, '-') # A list of the character-states corresponding to the columns 
               # in the contrast matrix
)

contrast.matrix

## ----Prepare data--------------------------------------------------------
my.phyDat <- phangorn::phyDat(my.data, type='USER', levels=c(1, 2))

## ----Prepare the data for analysis---------------------------------------
my.prepdata <- PrepareDataProfile(my.phyDat, precision=4e+04)

## ----Random tree---------------------------------------------------------
set.seed(888)
tree <- RandomTree(my.phyDat)

## ----NJ Tree-------------------------------------------------------------
tree <- NJTree(my.phyDat)
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
plot(tree)

## ----Starting score------------------------------------------------------
ProfileScore(tree, my.prepdata)

## ----Tree search---------------------------------------------------------
better.tree <- ProfileTreeSearch(ape::root(tree, '1', resolve.root=TRUE), my.prepdata, EdgeSwapper=RootedTBRSwap)

## ----Ratchet search------------------------------------------------------
# Less typing!
RootedSwappers <- list(RootedTBRSwap, RootedSPRSwap, RootedNNISwap)
better.tree <- ProfileRatchet(better.tree, my.prepdata,
                              swappers=RootedSwappers,
                              searchHits=10, searchIter=100, ratchIter=5)
par(mar=rep(0.25, 4), cex=0.75) # make plot easier to read
plot(better.tree)

## ----Suboptimal sampling-------------------------------------------------
suboptimals <- ProfileRatchet(better.tree, my.prepdata, 
                              swappers=list(RootedTBRSwap),
                              returnAll=TRUE, suboptimal=5, 
                              ratchHits=25, ratchIter=5000, 
                              bootstrapHits=15, bootstrapIter=450,
                              searchHits=10, searchIter=50)

## ----Plot suboptimal consensus-------------------------------------------
par(mar=rep(0.2, 4))
plot(my.consensus <- ape::consensus(suboptimals))

