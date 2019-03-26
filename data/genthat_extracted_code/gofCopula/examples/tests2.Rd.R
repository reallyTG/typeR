library(gofCopula)


### Name: gofKernel
### Title: 2 and 3 dimensional gof test of Scaillet
### Aliases: gofKernel

### ** Examples

data(IndexReturns)

gofKernel("normal", IndexReturns[c(1:100),c(1:2)], M = 5, MJ = 5)



