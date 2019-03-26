library(denoiSeq)


### Name: results
### Title: Compute the test statistic
### Aliases: results

### ** Examples

#pre -filtering to remove lowly expressed genes
ERCC <- ERCC[rowSums(ERCC) > 0, ]
RD <- new('readsData', counts = ERCC)
steps <- 30
#30 steps are just for illustration here. At least 5000 steps are adequate.
BI <- denoiseq(RD, steps)
rez <- results(BI, steps)
head(rez)

#Re-ordering according to most differentially expressed
rez <- rez[with(rez, order( ROPE_propn)), ]
head(rez, 10)

#Determine significant genes using a threshold of 0.38.
sgf <- rez[rez$ROPE_propn<0.38, ]
head(sgf)
dim(sgf)



