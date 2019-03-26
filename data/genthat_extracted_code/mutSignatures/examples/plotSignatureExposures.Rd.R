library(mutSignatures)


### Name: plotSignatureExposures
### Title: Generate Plot Signature
### Aliases: plotSignatureExposures

### ** Examples

tmp <- getTestRunArgs(6)
gp <- plotSignatureExposures(tmp)
gp + ggtitle("de novo mutSignatures")  + scale_fill_manual(values = c("#377eb8", "#4daf4a"))



