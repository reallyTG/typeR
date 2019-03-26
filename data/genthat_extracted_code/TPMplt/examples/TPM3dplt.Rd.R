library(TPMplt)


### Name: TPM3dplt
### Title: Plot 3d thermal processing-maps
### Aliases: TPM3dplt
### Keywords: PLTbuilder Processing-map

### ** Examples

epstable <- epsExtract(TPMdata, 0.7, 2, 3)
DMM <- DMMprocess(epstable)
PLTbd <- SVRModel(DMM)
TPM3dplt(PLTbd)



