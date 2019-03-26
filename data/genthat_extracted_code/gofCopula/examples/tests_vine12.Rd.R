library(gofCopula)


### Name: gofKendallKS
### Title: gof test (Kolmogorov-Smirnof) based on Kendall's process
### Aliases: gofKendallKS

### ** Examples

data(IndexReturns)

gofKendallKS("normal", IndexReturns[c(1:100),c(1:2)], M = 10)



