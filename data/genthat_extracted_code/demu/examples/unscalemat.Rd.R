library(demu)


### Name: unscalemat
### Title: Unscale a matrix back to its original ranges.
### Aliases: unscalemat

### ** Examples

library(demu)

design=matrix(runif(10,1,5),ncol=2,nrow=5)
r=getranges(design)
design=scaledesign(design,r)
unscalemat(design,r)




