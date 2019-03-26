library(sdnet)


### Name: cnFind-method
### Title: Find Network by Complexity
### Aliases: cnFind cnFindKL cnFind,list-method
###   cnFind,catNetworkEvaluate-method cnFindKL,list-method
###   cnFindKL,catNetworkEvaluate-method cnFind,dagEvaluate-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxpars=2, numcats=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  netlist <- cnSearchOrder(data=psamples, maxParentSet=2)
  bnet <- cnFind(object=netlist, complx=cnComplexity(cnet))
  bnet



