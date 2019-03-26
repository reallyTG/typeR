library(distrMod)


### Name: asHampel
### Title: Generating function for asHampel-class
### Aliases: asHampel
### Keywords: robust

### ** Examples

asHampel()

## The function is currently defined as
function(bound = Inf, biastype = symmetricBias(), normtype = NormType()){ 
    new("asHampel", bound = bound, biastype = biastype, normtype = normtype) }



