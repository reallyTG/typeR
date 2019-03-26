library(survey)


### Name: compressWeights
### Title: Compress replicate weight matrix
### Aliases: compressWeights compressWeights.default
###   compressWeights.repweights_compressed [.repweights_compressed
###   dim.repweights_compressed dimnames.repweights_compressed
###   as.matrix.repweights_compressed as.matrix.repweights
###   as.vector.repweights_compressed compressWeights.svyrep.design
### Keywords: survey manip

### ** Examples

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
rclus1c<-as.svrepdesign(dclus1,compress=TRUE)
rclus1<-as.svrepdesign(dclus1,compress=FALSE)



