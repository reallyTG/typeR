library(catnet)


### Name: cnSearchSA
### Title: Stochastic Network Search
### Aliases: cnSearchSA
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=6, maxParents=2, numCategories=2)
  psamples  <- cnSamples(object=cnet, numsamples=100)
  nets <- cnSearchSA(data=psamples, perturbations=NULL, 
		maxParentSet=1, maxComplexity=16)
  cc <- cnComplexity(object=cnet)
  cnFind(object=nets, complexity=cc)



