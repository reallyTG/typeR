library(TPMplt)


### Name: basic3d
### Title: 3D plots without labels
### Aliases: basic3d
### Keywords: internal

### ** Examples

epstable <- epsExtract(TPMdata, 0.7, 2, 3)
DMM <- DMMprocess(epstable)
PLTbd <- SVRModel(DMM)
PLT3dbd <- surfacebld(PLTbd, "eta")
basic3d(PLT3dbd, clrctrl="cm")



