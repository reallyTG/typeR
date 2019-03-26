library(catnet)


### Name: cnFindBIC-method
### Title: Find Network by BIC
### Aliases: cnFindBIC cnFindBIC,list-method
###   cnFindBIC,catNetworkEvaluate-method
### Keywords: methods graphs

### ** Examples

  library(catnet)
  cnet <- cnRandomCatnet(numnodes=12, maxParents=3, numCategories=2)
  psamples <- cnSamples(object=cnet, numsamples=10)
  nodeOrder <- sample(1:12)
  nets <- cnSearchOrder(data=psamples, perturbations=NULL, 
	maxParentSet=2, maxComplexity=36, nodeOrder)
  bicnet <- cnFindBIC(object=nets, numsamples=dim(psamples)[2])
  bicnet



