library(denoiSeq)


### Name: tunedStepSize
### Title: Get values of the tuned step sizes.
### Aliases: tunedStepSize

### ** Examples

#pre -filtering to remove lowly expressed genes
ERCC <- ERCC[rowSums(ERCC)>0, ]
RD <- new('readsData', counts = ERCC)
steps <- 30
#30 steps are just for illustration here. Atleast 5000 steps are adequate.
BI <- denoiseq(RD, steps)
tunedStepSize(BI)




