library(gofCopula)


### Name: gofKendallCvM
### Title: gof test (Cramer-von Mises) based on Kendall's process
### Aliases: gofKendallCvM

### ** Examples

data(IndexReturns)

gofKendallCvM("normal", IndexReturns[c(1:100),c(1:2)], M = 10)



