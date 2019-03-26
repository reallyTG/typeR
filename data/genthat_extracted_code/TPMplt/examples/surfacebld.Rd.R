library(TPMplt)


### Name: surfacebld
### Title: Build matrix for 3D plots
### Aliases: surfacebld
### Keywords: internal

### ** Examples

epstable <- epsExtract(TPMdata, 0.7, 2, 3)
DMM <- DMMprocess(epstable)
PLTbd <- SVRModel(DMM)
surfacebld(PLTbd, "eta")



