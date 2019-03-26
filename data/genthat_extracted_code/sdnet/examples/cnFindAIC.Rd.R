library(sdnet)


### Name: cnFindAIC-method
### Title: Find Network by AIC
### Aliases: cnFindAIC cnFindAIC,catNetworkEvaluate-method
###   cnFindAIC,dagEvaluate-method cnFindAIC,list-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=12, maxpars=3, numcats=2)
  psamples <- cnSamples(object=cnet, numsamples=10)
  nodeOrder <- sample(1:12)
  nets <- cnSearchOrder(data=psamples, pert=NULL, 
	maxParentSet=2, maxComplexity=36, nodeOrder)
  aicnet <- cnFindAIC(object=nets)
  aicnet



