library(sdnet)


### Name: cnLoglik-method
### Title: Sample Log-likelihood
### Aliases: cnLoglik cnLoglik,catNetwork-method
### Keywords: methods graphs distribution

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxpars = 3, numcats = 2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  cnLoglik(object=cnet, data=psamples)



