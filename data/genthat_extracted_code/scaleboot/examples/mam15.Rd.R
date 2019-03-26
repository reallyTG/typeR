library(scaleboot)


### Name: mam15
### Title: Mammal Phylogenetic Analysis for 15 Trees
### Aliases: mam15 mam15.relltest mam15.mt mam15.ass
### Keywords: datasets

### ** Examples

data(mam15)

## show the results for trees and edges
mam15.relltest # print stat, shtest, bootstrap probabilities, and AIC
summary(mam15.relltest) # print AU p-values

## Not run: 
##D ## simpler script to create mam15.trees
##D mam15.mt <- read.mt("mam15.mt")
##D mam15.ass <- read.ass("mam15.ass")
##D mam15.trees <- relltest(mam15.mt,nb=100000)
## End(Not run)

## Not run: 
##D ## script to create mam15.relltest
##D mam15.mt <- read.mt("mam15.mt")
##D mam15.ass <- read.ass("mam15.ass")
##D mam15.relltest <- relltest(mam15.mt,nb=100000,ass=mam15.ass)
## End(Not run)

## Not run: 
##D ## Parallel version of the above script (but different in random seed)
##D ## It took 13 mins (40 cpu's of Athlon MP 2000+)
##D mam15.mt <- read.mt("mam15.mt")
##D mam15.ass <- read.ass("mam15.ass")
##D library(parallel)
##D cl <- makeCluster(40)
##D mam15.relltest <- relltest(mam15.mt,nb=100000,ass=mam15.ass,cluster=cl)
## End(Not run)





