library(vsn)


### Name: scalingFactorTransformation
### Title: The transformation that is applied to the scaling parameter of
###   the vsn model
### Aliases: scalingFactorTransformation

### ** Examples

b  = seq(-3, 2, length=20)
fb = scalingFactorTransformation(b)
if(interactive())
  plot(b, fb, type="b", pch=16)



