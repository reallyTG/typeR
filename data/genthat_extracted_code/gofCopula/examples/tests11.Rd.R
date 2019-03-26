library(gofCopula)


### Name: gofPIOSRn
### Title: 2 and 3 dimensional gof test based on the in-and-out-of-sample
###   approach
### Aliases: gofPIOSRn

### ** Examples

data(IndexReturns)

gofPIOSRn("normal", IndexReturns[c(1:100),c(1:2)], M = 10)



