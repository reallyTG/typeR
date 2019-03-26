library(TauP.R)


### Name: ConvP2Vdepthinv
### Title: Vertex Depth and Ray Parameter
### Aliases: ConvP2Vdepth ConvP2Vdepthinv
### Keywords: misc

### ** Examples

data(model)

ConvP2Vdepth(7, model$vp, 6371 - model$z, 6361, 6371, FindDiscon(model))

ConvP2Vdepthinv(4881.467, model$vp, 6371 - model$z)



