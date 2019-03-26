library(sdnet)


### Name: cnFindBIC-method
### Title: Find Network by BIC
### Aliases: cnFindBIC cnFindBIC,list-method cnFindBIC,dagEvaluate-method
###   cnFindBIC,catNetworkEvaluate-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=12, maxpars=3, numcats=2)
  psamples <- cnSamples(object=cnet, numsamples=10)
  nodeOrder <- sample(1:12)
  nets <- cnSearchOrder(data=psamples, pert=NULL, 
	maxParentSet=2, maxComplexity=36, nodeOrder)
  bicnet <- cnFindBIC(object=nets, numsamples=dim(psamples)[2])
  bicnet



