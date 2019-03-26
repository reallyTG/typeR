library(RobExtremes)


### Name: validParameter-methods
### Title: Methods for function validParameter in Package 'RobExtremes'
### Aliases: validParameter-methods validParameter
###   validParameter,GParetoFamily-method
###   validParameter,WeibullFamily-method validParameter,GEVFamily-method
###   validParameter,ParetoFamily-method
###   validParameter,GEVFamilyMuUnknown-method
### Keywords: models

### ** Examples

 G <- GParetoFamily()
 validParameter(G, c(scale=0.1, shape=2))
 validParameter(G, c(scale=-0.1, shape=-2))



