library(distrMod)


### Name: asBias
### Title: Generating function for asBias-class
### Aliases: asBias
### Keywords: robust

### ** Examples

asBias()

## The function is currently defined as
function(biastype = symmetricBias(), normtype = NormType()){ 
     new("asBias",biastype = biastype, normtype = normtype) }



