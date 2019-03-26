library(ROptEst)


### Name: asL1
### Title: Generating function for asMSE-class
### Aliases: asL1
### Keywords: robust

### ** Examples

asL1()

## The function is currently defined as
function(biastype = symmetricBias(), normtype = NormType()){ 
         new("asL1", biastype = biastype, normtype = normtype) }



