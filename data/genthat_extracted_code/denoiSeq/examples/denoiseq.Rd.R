library(denoiSeq)


### Name: denoiseq
### Title: Differential expression analysis using a bottom-up model
### Aliases: denoiseq

### ** Examples

#pre -filtering to remove lowly expressed genes
ERCC <- ERCC[rowSums(ERCC)>0, ]
RD <- new('readsData', counts = ERCC)
steps <- 30
#30 steps are used for illustration here. Atleast 5000 steps are adequate.
BI <- denoiseq(RD, steps)




