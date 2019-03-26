library(catnet)


### Name: cnLoglik-method
### Title: Sample Log-likelihood
### Aliases: cnLoglik cnLoglik,catNetwork-method
### Keywords: methods graphs distribution

### ** Examples

  library(catnet)
  cnet <- cnRandomCatnet(numnodes=10, maxParents = 3, numCategories = 2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  cnLoglik(object=cnet, data=psamples)



