library(distrMod)


### Name: asMSE
### Title: Generating function for asMSE-class
### Aliases: asMSE
### Keywords: robust

### ** Examples

asMSE()

## The function is currently defined as
function(biastype = symmetricBias(), normtype = NormType()){ 
         new("asMSE", biastype = biastype, normtype = normtype) }



