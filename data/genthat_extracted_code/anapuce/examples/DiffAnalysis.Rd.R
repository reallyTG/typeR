library(anapuce)


### Name: DiffAnalysis
### Title: Differential Analysis for paired data
### Aliases: DiffAnalysis
### Keywords: programming

### ** Examples

data(spleen)
# Analysis on the first 100 genes
resSpleen <- DiffAnalysis(spleen[1:100, ], n = 1, ind.array = 1:6, name.A = "A.", name.M = "M.",
varmixt.meth = TRUE, dyeswap = TRUE, indDS = c(2,4,6))
# Histogramm of the raw-pvalues
# hist(resSpleen$PValueVM)



