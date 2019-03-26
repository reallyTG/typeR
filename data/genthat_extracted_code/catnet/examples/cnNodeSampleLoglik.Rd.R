library(catnet)


### Name: cnNodeSampleLoglik
### Title: Node Log-likelihood
### Aliases: cnNodeSampleLoglik cnNodeSampleProb
### Keywords: methods graphs

### ** Examples

  library(catnet)
  cnet <- cnRandomCatnet(numnodes=10, maxParents=3, numCategories=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  cnNodeSampleLoglik(node=5, parents=c(1,2), data=psamples)



