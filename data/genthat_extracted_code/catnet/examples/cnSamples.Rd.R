library(catnet)


### Name: cnSamples-method
### Title: Samples from Network
### Aliases: cnSamples cnSamples,catNetwork-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxParents=3, numCategories=3)
  ## generate a sample of size 100 from cnet
  psamples <- cnSamples(object=cnet, numsamples=100, output="frame", as.index=FALSE)
  ## perturbed sample
  nsamples <- 20
  perturbations <- rbinom(10, 2, 0.4)
  ## generate a perturbed sample of size 100 from cnet
  psamples <- cnSamples(object=cnet, numsamples=nsamples, perturbations, as.index=TRUE)



