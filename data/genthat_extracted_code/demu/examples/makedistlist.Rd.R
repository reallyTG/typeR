library(demu)


### Name: makedistlist
### Title: Make list of distance matrices for calculating GP correlation
###   matrices.
### Aliases: makedistlist

### ** Examples

library(demu)

design=matrix(runif(10,1,5),ncol=2,nrow=5)
r=getranges(design)
design=scaledesign(design,r)
l.v=makedistlist(design)



