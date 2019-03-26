library(sdnet)


### Name: cnNodeLoglik
### Title: Node Log-likelihood
### Aliases: cnNodeLoglik cnNodeLoglik,catNetwork-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxpars=3, numcats=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  cnNodeLoglik(cnet, node=5, data=psamples)



