library(AssocTests)


### Name: pcoc
### Title: PCoC for correcting for population stratification
### Aliases: pcoc

### ** Examples

pcocG.eg <- matrix(rbinom(4000, 2, 0.5), ncol = 40)
write.table(pcocG.eg, file = "pcocG.eg.txt", quote = FALSE,
       sep = "", row.names = FALSE, col.names = FALSE)
pcoc(genoFile = "pcocG.eg.txt", outFile.txt = "pcoc.result.txt",
       n.MonteCarlo = 50, num.splits = 10, miss.val = 9)



