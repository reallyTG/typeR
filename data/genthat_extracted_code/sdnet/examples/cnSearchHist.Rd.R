library(sdnet)


### Name: cnSearchHist
### Title: Parent Histogram Matrix
### Aliases: cnSearchHist
### Keywords: methods graphs

### ** Examples

  library(sdnet)
  cnet <- cnRandomCatnet(numnodes=8, maxpars=3, numcats=2)
  psamples  <- cnSamples(object=cnet, numsamples=100)
  mhisto <- cnSearchHist(data=psamples, pert=NULL, 
		maxParentSet=2, maxComplexity=100)
  mhisto



