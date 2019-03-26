library(gofCopula)


### Name: gofSn
### Title: The Sn gof test using the empirical copula
### Aliases: gofSn

### ** Examples

data(IndexReturns)

gofSn("normal", IndexReturns[c(1:100),c(1:2)], M = 10)



