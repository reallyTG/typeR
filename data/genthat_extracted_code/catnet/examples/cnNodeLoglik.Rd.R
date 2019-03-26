library(catnet)


### Name: cnNodeLoglik
### Title: Node Log-likelihood
### Aliases: cnNodeLoglik cnNodeLoglik,catNetwork-method
### Keywords: methods graphs

### ** Examples

  library(catnet)
  cnet <- cnRandomCatnet(numnodes=10, maxParents=3, numCategories=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  cnNodeLoglik(cnet, node=5, data=psamples)



