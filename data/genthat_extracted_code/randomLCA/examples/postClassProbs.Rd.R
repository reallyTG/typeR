library(randomLCA)


### Name: postClassProbs
### Title: Determines posterior class probabilities for fitted model
### Aliases: postClassProbs postClassProbs.randomLCA
### Keywords: methods

### ** Examples

pap.lca2 <- randomLCA(pap[,1:10],freq=pap$Freq,nclass=2)
print(postClassProbs(pap.lca2))



