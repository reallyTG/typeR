library(sdnet)


### Name: cnSearchOrder
### Title: Network Search for Given Node Order
### Aliases: cnSearchOrder cnSearchDags
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=12, maxpars=3, numcats=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  nodeOrder <- sample(1:12)
  nets <- cnSearchOrder(data=psamples, pert=NULL, 
		maxParentSet=2, maxComplexity=36, nodeOrder)
  ## next we find the network with complexity of the original one and plot it
  cc <- cnComplexity(object=cnet)
  cnFind(object=nets, complx=cc)




