library(catnet)


### Name: cnFindAIC-method
### Title: Find Network by AIC
### Aliases: cnFindAIC cnFindAIC,catNetworkEvaluate-method
###   cnFindAIC,list-method
### Keywords: methods graphs

### ** Examples

library(catnet)
  cnet <- cnRandomCatnet(numnodes=12, maxParents=3, numCategories=2)
  psamples <- cnSamples(object=cnet, numsamples=10)
  nodeOrder <- sample(1:12)
  nets <- cnSearchOrder(data=psamples, perturbations=NULL, 
	maxParentSet=2, maxComplexity=36, nodeOrder)
  aicnet <- cnFindAIC(object=nets)
  aicnet



