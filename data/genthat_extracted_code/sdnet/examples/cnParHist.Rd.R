library(sdnet)


### Name: cnParHist-method
### Title: Parenthood Histogram
### Aliases: cnParHist cnParHist,catNetworkEvaluate-method
###   cnParHist,list-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=20, maxpars=3, numcats=2)
  psamples <- cnSamples(cnet, 100)
  nodeOrder <- sample(1:20)
  nets <- cnSearchOrder(psamples, pert=NULL, 
	maxParentSet=2, maxComplexity=50, nodeOrder)
  cnParHist(object=nets)



