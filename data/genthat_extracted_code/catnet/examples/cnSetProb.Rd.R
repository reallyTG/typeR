library(catnet)


### Name: cnSetProb-method
### Title: Set Probability from Data
### Aliases: cnSetProb cnSetProb,catNetwork-method
###   cnSetProb,catSampleNetwork-method
### Keywords: methods graphs

### ** Examples

  library(catnet)
  cnet <- cnRandomCatnet(numnodes=10, maxParents=3, numCategories=3)
  psamples <- matrix(as.integer(1+rbinom(10*100, 2, 0.4)), nrow=10)
  rownames(psamples) <- cnet@nodes
  newcnet <- cnSetProb(object=cnet, data=psamples)



