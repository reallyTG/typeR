library(anapuce)


### Name: DiffAnalysis.unpaired
### Title: Differential Analysis for unpaired data
### Aliases: DiffAnalysis.unpaired
### Keywords: programming

### ** Examples

data(apo)
# Analysis on the first 100 genes
resApo <- DiffAnalysis.unpaired(apo[1:100,], n = 1, ind.array = 1:8, varmixt.meth = TRUE)
# Histogramm of the raw-pvalues
# hist(resApo$PValueVM)



