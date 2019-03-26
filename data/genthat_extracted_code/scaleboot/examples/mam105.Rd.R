library(scaleboot)


### Name: mam105
### Title: Mammal Phylogenetic Analysis for 105 Trees
### Aliases: mam105 mam105.relltest mam105.mt mam105.ass
### Keywords: datasets

### ** Examples

data(mam105)

## show the results for trees and edges
mam105.relltest # print stat, shtest, bootstrap probabilities, and AIC
summary(mam105.relltest) # print AU p-values

## Not run: 
##D ## simpler script to create mam105.trees
##D mam105.mt <- read.mt("mam105.mt")
##D mam105.ass <- read.ass("mam105.ass")
##D mam105.trees <- relltest(mam105.mt,nb=100000)
## End(Not run)

## Not run: 
##D ## script to create mam105.relltest
##D mam105.mt <- read.mt("mam105.mt")
##D mam105.ass <- read.ass("mam105.ass")
##D mam105.relltest <- relltest(mam105.mt,nb=100000,ass=mam105.ass)
## End(Not run)

## Not run: 
##D ## Parallel version of the above script (but different in random seed)
##D mam105.mt <- read.mt("mam105.mt")
##D mam105.ass <- read.ass("mam105.ass")
##D library(parallel)
##D cl <- makeCluster(40)
##D mam105.relltest <- relltest(mam105.mt,nb=100000,ass=mam105.ass,cluster=cl)
## End(Not run)





