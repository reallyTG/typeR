library(TPMplt)


### Name: TPM2dplt
### Title: Plot 2d thermal process maps
### Aliases: TPM2dplt
### Keywords: PLTbuilder Processing-map

### ** Examples

epstable <- epsExtract(TPMdata, 0.7, 2, 3)
DMM <- DMMprocess(epstable)
PLTbd <- SVRModel(DMM)
TPM2dplt(PLTbd)



