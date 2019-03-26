library(catnet)


### Name: cnSearchOrder
### Title: Network Search for Given Node Order
### Aliases: cnSearchOrder
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=12, maxParents=3, numCategories=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  nodeOrder <- sample(1:12)
  nets <- cnSearchOrder(data=psamples, perturbations=NULL, 
		maxParentSet=2, maxComplexity=36, nodeOrder)
  ## next we find the network with complexity of the original one and plot it
  cc <- cnComplexity(object=cnet)
  cnFind(object=nets, complexity=cc)



