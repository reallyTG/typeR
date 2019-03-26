library(hierfstat)


### Name: varcomp.glob
### Title: Estimate variance components and hierarchical F-statistics over
###   all loci
### Aliases: varcomp.glob
### Keywords: univar

### ** Examples

#load data set
data(gtrunchier)
attach(gtrunchier)
varcomp.glob(data.frame(Locality,Patch),gtrunchier[,-c(1,2)])



