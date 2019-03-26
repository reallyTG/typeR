library(distrMod)


### Name: validParameter-methods
### Title: Methods for function validParameter in Package 'distrMod'
### Aliases: validParameter-methods validParameter
###   validParameter,ParamFamily-method validParameter,L2ScaleUnion-method
###   validParameter,L2ScaleFamily-method
###   validParameter,L2LocationFamily-method
###   validParameter,L2LocationScaleFamily-method
###   validParameter,BinomFamily-method validParameter,PoisFamily-method
###   validParameter,L2ScaleShapeUnion-method
### Keywords: models

### ** Examples

 NS <- NormLocationScaleFamily()
 validParameter(NS, c(scale=0.1, loc=2))
 validParameter(NS, c(scale=-0.1, loc=2))
 validParameter(NS, c(scale=0, loc=2))
 validParameter(NS, c(mean=2, sd=2))



