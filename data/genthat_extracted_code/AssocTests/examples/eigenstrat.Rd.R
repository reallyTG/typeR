library(AssocTests)


### Name: eigenstrat
### Title: EIGENSTRAT for correcting for population stratification
### Aliases: eigenstrat

### ** Examples

eigenstratG.eg <- matrix(rbinom(3000, 2, 0.5), ncol = 30)
write.table(eigenstratG.eg, file = "eigenstratG.eg.txt", quote = FALSE,
            sep = "", row.names = FALSE, col.names = FALSE)
eigenstrat(genoFile = "eigenstratG.eg.txt", outFile.Robj = "eigenstrat.result.list",
             outFile.txt = "eigenstrat.result.txt", rm.marker.index = NULL,
             rm.subject.index = NULL, miss.val = 9, num.splits = 10,
             topK = NULL, signt.eigen.level = 0.01, signal.outlier = FALSE,
             iter.outlier = 5, sigma.thresh = 6)



