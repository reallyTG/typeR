library(sdnet)


### Name: cnNodeSampleLoglik
### Title: Node Log-likelihood
### Aliases: cnNodeSampleLoglik cnNodeSampleProb
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxpars=3, numcats=2)
  psamples <- cnSamples(object=cnet, numsamples=100)
  cnNodeSampleLoglik(node=5, pars=c(1,2), data=psamples)



