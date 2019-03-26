library(catnet)


### Name: cnSearchHist
### Title: Parent Histogram Matrix
### Aliases: cnSearchHist
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=8, maxParents=3, numCategories=2)
  psamples  <- cnSamples(object=cnet, numsamples=100)
  mhisto <- cnSearchHist(data=psamples, perturbations=NULL, 
		maxParentSet=2, maxComplexity=20)
  mhisto



