library(DoubleExpSeq)


### Name: DB.MAPlot
### Title: Plots Log-Fold Change versus Log-Concentration for
###   Inclusion/Exclusion Data
### Aliases: DB.MAPlot

### ** Examples

data(exon)
results.G1G2 <- DBGLM1( counts, offsets, groups)
de.tags.G1G2 <- rownames(results.G1G2$Sig)
DB.MAPlot(counts, offsets, groups, contrast=c(1,2), de.tags=de.tags.G1G2)



