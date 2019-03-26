library(demu)


### Name: scaledesign
### Title: Rescale a design matrix to the [0,1] hypercube.
### Aliases: scaledesign

### ** Examples

library(demu)

design=matrix(runif(10,1,5),ncol=2,nrow=5)
r=getranges(design)
scaledesign(design,r)




