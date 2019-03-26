library(distrMod)


### Name: L2ParamFamily-class
### Title: L2 differentiable parametric family
### Aliases: plot plot-methods L2ParamFamily-class FisherInfo
###   FisherInfo,L2ParamFamily,missing-method
###   FisherInfo,L2ParamFamily,ParamFamParameter-method L2deriv
###   L2deriv,L2ParamFamily,missing-method
###   L2deriv,L2ParamFamily,ParamFamParameter-method L2derivSymm
###   L2derivSymm,L2ParamFamily-method L2derivDistr
###   L2derivDistr,L2ParamFamily-method L2derivDistrSymm
###   L2derivDistrSymm,L2ParamFamily-method
###   checkL2deriv,L2ParamFamily-method
###   E,L2ParamFamily,EuclRandVariable,missing-method
###   E,L2ParamFamily,EuclRandMatrix,missing-method
###   E,L2ParamFamily,EuclRandVarList,missing-method
###   plot,L2ParamFamily,missing-method
### Keywords: classes models

### ** Examples

F1 <- new("L2ParamFamily")
plot(F1)

## selection of subpanels for plotting
F2 <- L2LocationScaleFamily()
layout(matrix(c(1,2,3,3), nrow=2, byrow=TRUE))
plot(F2,mfColRow = FALSE,
     to.draw.arg=c("p","q","loc"))
plot(F2,mfColRow = FALSE, inner=list("empirical cdf","pseudo-inverse",
     "L2-deriv, loc.part"), to.draw.arg=c("p","q","loc"))



