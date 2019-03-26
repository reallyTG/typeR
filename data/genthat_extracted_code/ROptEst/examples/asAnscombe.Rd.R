library(ROptEst)


### Name: asAnscombe
### Title: Generating function for asAnscombe-class
### Aliases: asAnscombe
### Keywords: robust

### ** Examples

asAnscombe()

## The function is currently defined as
function(eff = .95, biastype = symmetricBias(), normtype = NormType()){ 
    new("asAnscombe", eff = eff, biastype = biastype, normtype = normtype) }



