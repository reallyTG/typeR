library(catnet)


### Name: cnFind-method
### Title: Find Network by Complexity
### Aliases: cnFind cnFindKL cnFind,list-method
###   cnFind,catNetworkEvaluate-method cnFindKL,list-method
###   cnFindKL,catNetworkEvaluate-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxParents=2, numCategories=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  netlist <- cnSearchOrder(data=psamples, maxParentSet=2)
  bnet <- cnFind(object=netlist, complexity=cnComplexity(cnet))
  bnet



