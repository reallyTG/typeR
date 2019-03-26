library(denoiSeq)


### Name: getSamplesOf
### Title: Get posterior samples of a parameter
### Aliases: getSamplesOf

### ** Examples

#pre-filtering to remove lowly expressed genes
ERCC <- ERCC[rowSums(ERCC)>0, ]
RD <- new('readsData', counts = ERCC)
steps <- 30
#30 steps are just for illustration here. Atleast 5000 steps are adequate.
BI <- denoiseq(RD, steps)
samples <- getSamplesOf(BI, 'ERCC-00051', steps)
plot(samples, type='l', main = 'History plot of ERCC-00051')




